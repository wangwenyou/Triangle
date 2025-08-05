
import Cocoa
import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {

    var statusItem: NSStatusItem!
    var mouseLocation: NSPoint { NSEvent.mouseLocation }
    var screens: [NSScreen] { NSScreen.screens }
    var lastMousePosition: NSPoint = .zero
    var isWarping = false

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        setupStatusItem()
        
        if !checkAccessibilityPermissions() {
            promptForAccessibilityPermissions()
        }
        
        startMouseTracking()
    }

    func setupStatusItem() {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        if let button = statusItem.button {
            button.image = NSImage(systemSymbolName: "arrow.left.and.right.circle", accessibilityDescription: "Triangle")
        }
        
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Quit Triangle", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
        statusItem.menu = menu
    }

    func checkAccessibilityPermissions() -> Bool {
        return AXIsProcessTrusted()
    }

    func promptForAccessibilityPermissions() {
        let alert = NSAlert()
        alert.messageText = "Accessibility Permissions Required"
        alert.informativeText = "Triangle needs Accessibility permissions to move the mouse. Please grant permissions in System Settings > Privacy & Security > Accessibility."
        alert.addButton(withTitle: "Open System Settings")
        alert.addButton(withTitle: "Quit")
        
        if alert.runModal() == .alertFirstButtonReturn {
            if let url = URL(string: "x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility") {
                NSWorkspace.shared.open(url)
            }
        } else {
            NSApp.terminate(nil)
        }
    }

    func startMouseTracking() {
        NSEvent.addGlobalMonitorForEvents(matching: .mouseMoved) { [weak self] event in
            self?.handleMouseMoved(event)
        }
    }

    func handleMouseMoved(_ event: NSEvent) {
        if isWarping {
            isWarping = false
            return
        }

        let currentMousePosition = mouseLocation
        let allScreensFrame = screens.reduce(NSRect.null) { $0.union($1.frame) }

        // Check if mouse is at the far left edge
        if currentMousePosition.x <= allScreensFrame.minX {
            let newPosition = CGPoint(x: allScreensFrame.maxX - 2, y: currentMousePosition.y)
            warpCursor(to: newPosition)
        } 
        // Check if mouse is at the far right edge
        else if currentMousePosition.x >= allScreensFrame.maxX - 1 {
            let newPosition = CGPoint(x: allScreensFrame.minX + 1, y: currentMousePosition.y)
            warpCursor(to: newPosition)
        }
    }

    func warpCursor(to position: CGPoint) {
        isWarping = true
        CGWarpMouseCursorPosition(position)
        // We need to post a fake mouse event to update the system's internal state
        let fakeEvent = CGEvent(mouseEventSource: nil, mouseType: .mouseMoved, mouseCursorPosition: position, mouseButton: .left)
        fakeEvent?.post(tap: .cgSessionEventTap)
    }
}
