/*
 * Copyright (C) 2022 - Darrel Griët    <dgriet@gmail.com>
 *               2017 - Florent Revest  <revestflo@gmail.com>
 *                    - Niels Tholenaar <info@123quality.nl>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.5
import org.asteroid.controls 1.0
import QtSensors 5.3
import QtGraphicalEffects 1.15

Application {
    id: app

    centerColor: "#29A600"
    outerColor: "#070C00"

    property int rotation: 0;
    property int calibration: 0;
    property int ringValueOffset: Math.sqrt(Math.pow(Dims.l(40), 2) / 2);

    Compass {
        active: true
        onReadingChanged: {
            app.rotation = reading.azimuth;
            app.calibration = reading.calibrationLevel;
        }
    }

    StatusPage {
        //% "<h3>No data</h3>Calibrate the sensor by moving it in an ∞ figure."
        //text: qsTrId("id-no-data-calibrate")
        text: "<h3>No data</h3>Calibrate the sensor by moving it in an ∞ figure."
        icon: "ios-infinite-outline"
        visible: !app.calibration
    }

    Item {
        visible: app.calibration
        anchors.fill: parent

        Item {
            id: centerDisplay
            anchors.fill: parent
            Label {
                anchors.centerIn: parent
                text: app.rotation + "°"
                font {
                    pixelSize: parent.height / 4
                    capitalization: Font.Capitalize
                    styleName: "SemiCondensed"
                    kerning: true
                    preferShaping: true
                }
            }
            Image {
                anchors.top: parent.top
                anchors.centerIn: parent
                anchors.verticalCenterOffset: -Dims.l(35)
                width: Dims.l(10)
                height: width
                source: "compass.svg"
            }
        }

        Item {
            id: outerRing
            anchors.fill: parent
            rotation: -app.rotation
            Label {
                rotation: app.rotation
                anchors.centerIn: parent
                anchors.verticalCenterOffset: -Dims.l(40)
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "N"
                color: "#c2620c"
                font {
                    pixelSize: Dims.l(10)
                    capitalization: Font.Capitalize
                    styleName: "Condensed Bold"
                    kerning: true
                    preferShaping: true
                }
            }
            Label {
                rotation: app.rotation
                anchors.centerIn: parent
                anchors.horizontalCenterOffset: Dims.l(40)
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "E"
                font {
                    pixelSize: Dims.l(10)
                    capitalization: Font.Capitalize
                    styleName: "Condensed Bold"
                    kerning: true
                    preferShaping: true
                }
            }
            Label {
                rotation: app.rotation
                anchors.centerIn: parent
                anchors.verticalCenterOffset: Dims.l(40)
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "S"
                font {
                    pixelSize: Dims.l(10)
                    capitalization: Font.Capitalize
                    styleName: "Condensed Bold"
                    kerning: true
                    preferShaping: true
                }
            }
            Label {
                rotation: app.rotation
                anchors.centerIn: parent
                anchors.horizontalCenterOffset: -Dims.l(40)
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "W"
                font {
                    pixelSize: Dims.l(10)
                    capitalization: Font.Capitalize
                    styleName: "Condensed Bold"
                    kerning: true
                    preferShaping: true
                }
            }

            Label {
                rotation: app.rotation
                anchors.centerIn: parent
                anchors.verticalCenterOffset: -ringValueOffset
                anchors.horizontalCenterOffset: ringValueOffset
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "NE"
                font {
                    pixelSize: Dims.l(8)
                    capitalization: Font.Capitalize
                    styleName: "Condensed Bold"
                    kerning: true
                    preferShaping: true
                }
            }
            Label {
                rotation: app.rotation
                anchors.centerIn: parent
                anchors.verticalCenterOffset: ringValueOffset
                anchors.horizontalCenterOffset: ringValueOffset
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "SE"
                font {
                    pixelSize: Dims.l(8)
                    capitalization: Font.Capitalize
                    styleName: "Condensed Bold"
                    kerning: true
                    preferShaping: true
                }
            }
            Label {
                rotation: app.rotation
                anchors.centerIn: parent
                anchors.verticalCenterOffset: ringValueOffset
                anchors.horizontalCenterOffset: -ringValueOffset
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "SW"
                font {
                    pixelSize: Dims.l(8)
                    capitalization: Font.Capitalize
                    styleName: "Condensed Bold"
                    kerning: true
                    preferShaping: true
                }
            }
            Label {
                rotation: app.rotation
                anchors.centerIn: parent
                anchors.verticalCenterOffset: -ringValueOffset
                anchors.horizontalCenterOffset: -ringValueOffset
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: "NW"
                font {
                    pixelSize: Dims.l(8)
                    capitalization: Font.Capitalize
                    styleName: "Condensed Bold"
                    kerning: true
                    preferShaping: true
                }
            }
        }
    }
}
