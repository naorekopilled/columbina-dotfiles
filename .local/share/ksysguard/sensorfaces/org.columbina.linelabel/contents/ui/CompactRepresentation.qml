import QtQuick
import QtQuick.Controls as QQC2
import QtQuick.Layouts

import org.kde.kirigami as Kirigami

import org.kde.ksysguard.sensors as Sensors
import org.kde.ksysguard.faces as Faces

// The stock line chart only draws the graph in a panel; this adds the title and the current percent beside it.
Faces.CompactSensorFace {
    id: root

    Layout.minimumWidth: horizontalFormFactor ? row.implicitWidth : defaultMinimumSize
    Layout.preferredWidth: horizontalFormFactor ? row.implicitWidth : -1
    Layout.maximumWidth: horizontalFormFactor ? row.implicitWidth : -1

    Sensors.Sensor {
        id: sensor
        sensorId: root.controller.highPrioritySensorIds[0] ?? ""
    }

    TextMetrics {
        id: widest
        font: value.font
        text: "100%"
    }

    contentItem: RowLayout {
        id: row
        spacing: Kirigami.Units.smallSpacing

        QQC2.Label {
            text: root.controller.title
            font.bold: true
            color: Kirigami.Theme.highlightColor
        }
        LineChart {
            controller: root.controller
            Layout.preferredWidth: Kirigami.Units.gridUnit * 3.5
            Layout.fillHeight: true
            Layout.topMargin: Kirigami.Units.smallSpacing
            Layout.bottomMargin: Kirigami.Units.smallSpacing
        }
        QQC2.Label {
            id: value
            // shortcut: assumes a percent sensor, which all three top-bar widgets use
            text: Math.round(sensor.value || 0) + "%"
            horizontalAlignment: Text.AlignRight
            Layout.preferredWidth: widest.width
            Layout.rightMargin: Kirigami.Units.largeSpacing
        }
    }
}
