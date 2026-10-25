#!/usr/bin/env python3
# Moves the Plasma lock screen clock to the bottom-right corner (Columbina rice).
# Safe after Plasma updates: only edits the file when the original clock lines are found unchanged.
import shutil, sys

target = sys.argv[1] if len(sys.argv) > 1 else "/usr/share/plasma/shells/org.kde.plasma.desktop/contents/lockscreen/LockScreenUi.qml"
marker = "// columbina-rice: clock bottom-right"
original = """            anchors.horizontalCenter: parent.horizontalCenter
            y: (mainBlock.userList.y + mainStack.y)/2 - height/2
"""
patched = f"""            {marker}
            anchors.right: parent.right
            anchors.rightMargin: Kirigami.Units.gridUnit * 4
            y: parent.height - height - Kirigami.Units.gridUnit * 5
"""

text = open(target).read()
if marker in text:
    print("already patched:", target)
elif text.count(original) == 1:
    shutil.copy2(target, target + ".columbina-orig")
    open(target, "w").write(text.replace(original, patched))
    print("patched:", target)
else:
    print("clock code changed in this Plasma version, left untouched:", target)
