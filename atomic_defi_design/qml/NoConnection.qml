import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

import "Screens"
import "Constants"
import "Components"

Rectangle {
    id: app
    visible: !API.app.internet_checker.internet_reacheable
    color: Style.colorTheme8

    ColumnLayout {
        spacing: 20
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        DefaultText {
            text_value: API.app.settings_pg.empty_string + (qsTr("No connection"))
            Layout.alignment: Qt.AlignHCenter
            font.pixelSize: Style.textSize3
        }

        DefaultText {
            text_value: API.app.settings_pg.empty_string + (qsTr("Please make sure you are connected to the internet"))
            Layout.alignment: Qt.AlignHCenter
        }


        DefaultText {
            text_value: API.app.settings_pg.empty_string + (qsTr("Will automatically retry in %1 seconds").arg(General.formatDouble(API.app.internet_checker.seconds_left_to_auto_retry, 0)))
            Layout.alignment: Qt.AlignHCenter
        }

        DefaultBusyIndicator {
            Layout.alignment: Qt.AlignHCenter
        }

        DefaultButton {
            text: API.app.settings_pg.empty_string + (qsTr("Retry"))
            onClicked: API.app.internet_checker.retry()
            Layout.alignment: Qt.AlignHCenter
        }
    }
}



/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
