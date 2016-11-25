<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/frm_SPV_MasterPageSupervisor.Master" CodeBehind="frm_SPV_ConEstadoDeControles.aspx.vb" Inherits="GCA.SPV.UserInterface.frm_SPV_ConEstadoDeControles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="titulo" runat="server">
    <h2>Gráfico Estado de los Controles</h2>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="menu" runat="server">
    <!-- /. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
           <ul class="nav" id="main-menu">
               <!-- Controles-->
                <li>
                    <a class="btn" style="text-align:left" data-toggle="collapse" data-target="#dtControles"><i class="fa fa-book" aria-hidden="true"></i> Controles</a>
                    <ul id="dtControles" class="collapse nav" style="padding-top:0px">
                        <li>
                            <a href="frm_SPV_ConEstadoDeControles.aspx">Gráfico Estado de los Controles</a>
                        </li>
                        <li>
                            <a href="frm_SPV_EstadoOficinaControles.aspx">Estado de los Controles</a>
                        </li>
                        <li >
                            <a href="frm_SPV_CrearControl.aspx">Crear control</a>
                        </li>
                         <li >
                            <a href="frm_SPV_AdministrarControl.aspx">Gestionar Controles</a>
                        </li>
                         <li>
                            <a href="frm_SPV_AsignarControl.aspx">Asignar control</a>
                        </li>
                         <li>
                            <a href="frm_SPV_Historial.aspx">Historial de Controles Entregados</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a class="btn" style="text-align:left" data-toggle="collapse" data-target="#dtJefeOficina"><i class="fa fa-user" aria-hidden="true"></i> Jefe Oficina</a>
                    <ul id="dtJefeOficina" class="collapse nav" style="padding-top:0px">
                        <li>
                            <a href="frm_SPV_CrearJefeOficina.aspx">Crear Jefe de Oficina</a>
                        </li>
                        <li>
                            <a href="frm_SPV_AdministrarJefeOficina.aspx">Gestionar Jefes de Oficina</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a class="btn" style="text-align:left" data-toggle="collapse" data-target="#dtSupervisor"><i class="fa fa-user" aria-hidden="true"></i> Supervisor</a>
                    <ul id="dtSupervisor" class="collapse nav" style="padding-top:0px">
                        <li>
                            <a href="frm_SPV_CrearSupervisor.aspx">Crear Supervisor</a>
                        </li>
                        <li>
                            <a href="frm_SPV_AdministrarSupervisor.aspx">Gestionar Supervisores</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a class="btn" style="text-align:left" data-toggle="collapse" data-target="#dtOficina"><i class="fa fa-university" aria-hidden="true"></i> Oficina</a>
                    <ul id="dtOficina" class="collapse nav" style="padding-top:0px">
                        <li>
                            <a href="frm_SPV_CrearOficina.aspx">Crear Oficina</a>
                        </li>
                        <li>
                            <a href="frm_SPV_AdministrarOficina.aspx">Gestionar Oficinas</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a class="btn" style="text-align:left" data-toggle="collapse" data-target="#dtPeriodo"><i class="fa fa-clock-o" aria-hidden="true"></i> Período</a>
                    <ul id="dtPeriodo" class="collapse nav" style="padding-top:0px">
                        <li>
                            <a href="frm_SPV_CrearPeriodo.aspx">Crear Periodo</a>
                        </li>
                        <li>
                            <a href="frm_SPV_AdministrarPeriodo.aspx">Gestionar Periodos</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="fa fa-question-circle" aria-hidden="true"></i> Ayuda</a>
                </li>
               <li>
                    <a href="http://localhost:51014/Presentation/frm_IDX_Index.aspx"><i class="fa fa-sign-out" aria-hidden="true"></i> Salir</a>
                </li>
            </ul>
        </div>
    </nav>
    <!-- /. NAV SIDE  -->
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <script src="../DESARROLLO/JS/jquery-1.10.2.js"></script>
    <script src="../DESARROLLO/JS/bootstrap.min.js"></script>
    <script src="../DESARROLLO/JS/custom.js"></script>
    <script src="../DESARROLLO/highCharts/jquery.js"></script>
    <script src="../DESARROLLO/highCharts/highcharts.js"></script>
    <script src="../DESARROLLO/highCharts/exporting.js"></script>
    <img id="spinner" class="center" src="../DESARROLLO/Imagenes/spinner.gif" />
    <div id="container" class="grafico">
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
