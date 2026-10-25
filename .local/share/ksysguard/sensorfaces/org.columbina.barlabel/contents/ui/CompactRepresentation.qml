import QtQuick
import QtQuick.Controls as QQC2
import QtQuick.Layouts

import org.kde.kirigami as Kirigami

import org.kde.ksysguard.sensors as Sensors
import org.kde.ksysguard.faces as Faces

// The stock bar chart only draws the bars in a panel; this adds the title and the current percent beside them.
Faces.CompactSensorFace {
    id: root

    Layout.minimumWidth: horizontalFormFactor ? row.implicitWidth : defaultMinimumSize
    Layout.preferredWidth: horizontalFormFactor ? row.implicitWidth : -1
    Layout.maximumWidth: horizontalFormFactor ? row.implicitWidth : -1

    // the total sensor (e.g. cpu/all/usage) gives one number when the bars are per core
    Sensors.Sensor {
        id: sensor
        sensorId: root.controller.totalSensors[0] ?? root.controller.highPrioritySensorIds[0] ?? ""
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
        BarChart {
            id: barChart
            controller: root.controller
            updateRateLimit: root.controller.updateRateLimit
            barWidth: barCount > 1 ? 4 : 8
            spacing: 2
            // solid colour: the chart draws a translucent background as opaque white
            backgroundColor: Qt.tint(Kirigami.Theme.backgroundColor, Qt.rgba(0.67, 0.67, 0.95, 0.15))
            Layout.preferredWidth: barCount * (barWidth + spacing) - spacing
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
