<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/frm_SPV_MasterPageSupervisor.Master" CodeBehind="frm_SPV_ConEstadoDeControles.aspx.vb" Inherits="GCA.SPV.UserInterface.frm_SPV_ConEstadoDeControles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="titulo" runat="server">
    <h2>Estado de los Controles</h2>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="menu" runat="server">
    <!-- /. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">
                <li class="active-link">
                    <a href="frm_SPV_ConEstadoDeControles.aspx"><i class="fa fa-desktop"></i>Estado de los controles</a>
                </li>
                <li>
                    <a href="frm_SPV_CrearControl.aspx"><i class="fa fa-table "></i>Crear control</a>
                </li>
                <li>
                    <a href="frm_SPV_AdministrarControl.aspx"><i class="fa fa-qrcode "></i>Gestionar Controles</a>
                </li>
                <li>
                    <a href="frm_SPV_AsignarControl.aspx"><i class="fa fa-edit "></i>Asignar control</a>
                </li>
                <li>
                    <a href="frm_SPV_CrearJefeOficina.aspx"><i class="fa fa-table "></i>Crear Jefe de Oficina</a>
                </li>
                <li>
                    <a href="frm_SPV_AdministrarJefeOficina.aspx"><i class="fa fa-qrcode "></i>Gestionar Jefes de Oficina</a>
                </li>
                <li>
                    <a href="frm_SPV_CrearSupervisor.aspx"><i class="fa fa-table "></i>Crear Supervisor</a>
                </li>
                <li>
                    <a href="frm_SPV_AdministrarSupervisor.aspx"><i class="fa fa-qrcode "></i>Gestionar Supervisores</a>
                </li>
                <li>
                    <a href="frm_SPV_CrearOficina.aspx"><i class="fa fa-table "></i>Crear Oficina</a>
                </li>
                <li>
                    <a href="frm_SPV_AdministrarOficina.aspx"><i class="fa fa-qrcode "></i>Gestionar Oficinas</a>
                </li>
                <li>
                    <a href="frm_SPV_CrearPeriodo.aspx"><i class="fa fa-table "></i>Crear Periodo</a>
                </li>
                <li>
                    <a href="frm_SPV_AdministrarPeriodo.aspx"><i class="fa fa-qrcode "></i>Gestionar Periodos</a>
                </li>
                <li>
                    <a href="frm_SPV_ConGenerarReporte.aspx"><i class="fa fa-bar-chart-o"></i>Generar reportes</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-edit "></i>Ayuda</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-table "></i>Salir</a>
                </li>
            </ul>
        </div>
    </nav>
    <!-- /. NAV SIDE  -->
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <script src="../DESARROLLO/highCharts/jquery.js"></script>
    <script src="../DESARROLLO/highCharts/highcharts.js"></script>
    <script src="../DESARROLLO/highCharts/exporting.js"></script>
    <img id="spinner" style="width: 50px; height: 50px; display: block; margin-left: auto; margin-right: auto;" src="../DESARROLLO/Imagenes/spinner.gif" />
    <div id="container" style="width: 100%">
    </div>
    <script type="text/javascript">
        $(function () {
            $.ajax({
                type: "POST",
                url: "frm_SPV_ConEstadoDeControles.aspx/obtenerInformacionEstadoControles",
                data: "{}",
                contentType: "application/json",
                dataType: "json",
                success: function (Result) {
                    Result = Result.d;
                    var data = [];

                    var result = Result.split(";");
                    for (var i = 0; i < result.length; i++) {
                        var datas = result[i].split(",");
                        if (datas[0].length > 1) {
                            var serie = new Array(datas[0], parseInt(datas[1]));
                            data.push(serie);
                        }
                    }
                    generarGrafico(data);
                    document.getElementById("spinner").style.visibility = 'hidden';

                },
                error: function (Result) {
                    alert("¡Estamos teniendo probelmas de conexíon, verifique y vuelva a cargar!", Result.d);
                    document.getElementById("spinner").style.visibility = 'hidden';
                    //window.location = "frm_SPV_ConEstadoDeControles.aspx";

                }
            });
        });


        function generarGrafico(series) {
            $(function () {

                Highcharts.setOptions({
                    colors: ['#4DE510', '#FBFF00', '#FFB600', '#E51A10', '#7F3D91']
                });


                $('#container').highcharts({
                    chart: {
                        plotBackgroundColor: null,
                        plotBorderWidth: 1,
                        plotShadow: false
                    },
                    title: {
                        text: 'Estado de controles asignados'
                    },
                    subtitle: {
                        text: 'Gráfico 1'
                    },
                    tooltip: {
                        pointFormat: '{series.name}: {point.y} (<b>{point.percentage:.1f}%</b>)',

                    },
                    plotOptions: {
                        series: {
                            cursor: 'pointer',
                            events: {
                                click: function () {
                                    //window.location = "http://www.cristalab.com";
                                }
                            }
                        },
                        pie: {

                            allowPointSelect: true,
                            cursor: 'pointer',
                            dataLabels: {
                                enabled: true,
                                format: '<b>{point.name}</b>: {point.y}',
                                style: {
                                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                                }

                            }
                        }
                    },
                    series: [{
                        type: 'pie',
                        name: 'Cantidad',
                        data: series
                    }]
                });

            });
        }

    </script>
</asp:Content>
