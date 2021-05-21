<?xml version="1.0"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <style type="text/css">
                    body{
                    padding: 10px 30px;
                    }
                    table th{
                    background-color: #CCC;
                    }
                    table td, table th{
                    border: 1px solid black;
                    padding: 5px 10px;
                    }
                    ul{
                    margin: 5px;
                    padding-left: 10px;
                    }
                </style>
            </head>
            <body>
                <h4>Расписание автобусов</h4>
                <table>
                    <tr>
                        <th>Направление</th>
                        <th>Остановки</th>
                        <th>Дата</th>
                        <th>Время отправления</th>
                    </tr>
                    <xsl:for-each select="schedule/bus">
                        <tr>
                            <td>
                                <xsl:value-of select="to"/>
                            </td>
                            <td>
                                <ul>
                                    <xsl:for-each select="stops/stop">
                                        <li>
                                            <xsl:value-of select="current()"/>
                                        </li>
                                    </xsl:for-each>
                                </ul>
                            </td>
                            <td>
                                <xsl:value-of select="date"/>
                            </td>
                            <td>
                                <ol>
                                    <xsl:for-each select="tours/tour">
                                        <li>
                                            <xsl:value-of select="time"/>
                                            <xsl:text> - </xsl:text>
                                            <xsl:value-of select="price"/>
                                            <xsl:text>грн - </xsl:text>
                                            <xsl:value-of select="free"/>
                                            <xsl:text> свободных мест</xsl:text>
                                        </li>
                                    </xsl:for-each>
                                </ol>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <h4>Сортировка даты по возрастанию с фильтрацией по цене поездки &lt; 160 грн.</h4>
                <table>
                    <tr>
                        <th>Направление</th>
                        <th>Остановки</th>
                        <th>Дата</th>
                        <th>Время отправления</th>
                    </tr>
                    <xsl:for-each select="schedule/bus[tours/tour/price&lt;160]">
                        <xsl:sort select="date" order="ascending"/>
                        <tr>
                            <td>
                                <xsl:value-of select="to"/>
                            </td>
                            <td>
                                <ul>
                                    <xsl:for-each select="stops/stop">
                                        <li>
                                            <xsl:value-of select="current()"/>
                                        </li>
                                    </xsl:for-each>
                                </ul>
                            </td>
                            <td>
                                <xsl:value-of select="date"/>
                            </td>
                            <td>
                                <ol>
                                    <xsl:for-each select="tours/tour[price&lt;160]">
                                        <li>
                                            <xsl:value-of select="time"/>
                                            <xsl:text> - </xsl:text>
                                            <xsl:value-of select="price"/>
                                            <xsl:text>грн - </xsl:text>
                                            <xsl:value-of select="free"/>
                                            <xsl:text> свободных мест</xsl:text>
                                        </li>
                                    </xsl:for-each>
                                </ol>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>