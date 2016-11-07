<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/frm_OFI_MasterPageOficina.Master" CodeBehind="ParaPruebasXD.aspx.vb" Inherits="GCA.OFI.UserInterface.ParaPruebasXD" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link id="themecss" rel="stylesheet" type="text/css" href="//www.shieldui.com/shared/components/latest/css/light-mint/all.min.css" />
    <script type="text/javascript" src="//www.shieldui.com/shared/components/latest/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="//www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="menu" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="titulo" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" runat="server">
    <link href="/Content/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<div class="outer">
    <h3>Message History</h3>
    <div id="timeline"></div>
</div>
<script type="text/javascript">
    jQuery(function ($) {
        $("#timeline").shieldTimeline({
            dataSource: {
                data: [
                    {
                        title: '<span class="time">2016/02/15 10:35</span> David F.',
                        text: "Hey! Sure, I will message you the complete instructions later today.<br />Cheers!",
                        iconCls: "fa fa-circle",
                        collapsed: true
                    },
                    {
                        title: '<span class="time">2016/02/15 10:35</span> Followed',
                        text: "By J.R. Simpson",
                        iconCls: "fa fa-circle"
                    },
                    {
                        title: '<span class="time">2016/02/14 08:32</span> David F.',
                        text: "Hi Dave,<br />I was wondering if you can tell me how to " + 
                            "setup my new machine.<br />Thanks in advance!",
                        iconCls: "fa fa-circle",
                        collapsed: true
                    },
                    {
                        title: '<span class="time">2016/02/13 14:20</span> Updated Publications',
                        text: "<a href=\"#\"><em>\"3D Rendering in the Web Browser\"</em></a>",
                        iconCls: "fa fa-circle"
                    },
                                        {
                                            title: '<span class="time">2016/02/15 10:35</span> Followed',
                                            text: "By J.R. Simpson",
                                            iconCls: "fa fa-circle"
                                        },
                    {
                        title: '<span class="time">2016/02/14 08:32</span> David F.',
                        text: "Hi Dave,<br />I was wondering if you can tell me how to " +
                            "setup my new machine.<br />Thanks in advance!",
                        iconCls: "fa fa-circle",
                        collapsed: true
                    },
                    {
                        title: '<span class="time">2016/02/13 14:20</span> Updated Publications',
                        text: "<a href=\"#\"><em>\"3D Rendering in the Web Browser\"</em></a>",
                        iconCls: "fa fa-circle"
                    },
                                        {
                                            title: '<span class="time">2016/02/15 10:35</span> Followed',
                                            text: "By J.R. Simpson",
                                            iconCls: "fa fa-circle"
                                        },
                    {
                        title: '<span class="time">2016/02/14 08:32</span> David F.',
                        text: "Hi Dave,<br />I was wondering if you can tell me how to " +
                            "setup my new machine.<br />Thanks in advance!",
                        iconCls: "fa fa-circle",
                        collapsed: true
                    },
                    {
                        title: '<span class="time">2016/02/13 14:20</span> Updated Publications',
                        text: "<a href=\"#\"><em>\"3D Rendering in the Web Browser\"</em></a>",
                        iconCls: "fa fa-circle"
                    },
                                        {
                                            title: '<span class="time">2016/02/15 10:35</span> Followed',
                                            text: "By J.R. Simpson",
                                            iconCls: "fa fa-circle"
                                        },
                    {
                        title: '<span class="time">2016/02/14 08:32</span> David F.',
                        text: "Hi Dave,<br />I was wondering if you can tell me how to " +
                            "setup my new machine.<br />Thanks in advance!",
                        iconCls: "fa fa-circle",
                        collapsed: true
                    },
                    {
                        title: '<span class="time">2016/02/13 14:20</span> Updated Publications',
                        text: "<a href=\"#\"><em>\"3D Rendering in the Web Browser\"</em></a>",
                        iconCls: "fa fa-circle"
                    },
                                        {
                                            title: '<span class="time">2016/02/15 10:35</span> Followed',
                                            text: "By J.R. Simpson",
                                            iconCls: "fa fa-circle"
                                        },
                    {
                        title: '<span class="time">2016/02/14 08:32</span> David F.',
                        text: "Hi Dave,<br />I was wondering if you can tell me how to " +
                            "setup my new machine.<br />Thanks in advance!",
                        iconCls: "fa fa-circle",
                        collapsed: true
                    },
                    {
                        title: '<span class="time">2016/02/13 14:20</span> Updated Publications',
                        text: "<a href=\"#\"><em>\"3D Rendering in the Web Browser\"</em></a>",
                        iconCls: "fa fa-circle"
                    },
                                        {
                                            title: '<span class="time">2016/02/15 10:35</span> Followed',
                                            text: "By J.R. Simpson",
                                            iconCls: "fa fa-circle"
                                        },
                    {
                        title: '<span class="time">2016/02/14 08:32</span> David F.',
                        text: "Hi Dave,<br />I was wondering if you can tell me how to " +
                            "setup my new machine.<br />Thanks in advance!",
                        iconCls: "fa fa-circle",
                        collapsed: true
                    },
                    {
                        title: '<span class="time">2016/02/13 14:20</span> Updated Publications',
                        text: "<a href=\"#\"><em>\"3D Rendering in the Web Browser\"</em></a>",
                        iconCls: "fa fa-circle"
                    },
                                        {
                                            title: '<span class="time">2016/02/15 10:35</span> Followed',
                                            text: "By J.R. Simpson",
                                            iconCls: "fa fa-circle"
                                        },
                    {
                        title: '<span class="time">2016/02/14 08:32</span> David F.',
                        text: "Hi Dave,<br />I was wondering if you can tell me how to " +
                            "setup my new machine.<br />Thanks in advance!",
                        iconCls: "fa fa-circle",
                        collapsed: true
                    },
                    {
                        title: '<span class="time">2016/02/13 14:20</span> Updated Publications',
                        text: "<a href=\"#\"><em>\"3D Rendering in the Web Browser\"</em></a>",
                        iconCls: "fa fa-circle"
                    },
                                        {
                                            title: '<span class="time">2016/02/15 10:35</span> Followed',
                                            text: "By J.R. Simpson",
                                            iconCls: "fa fa-circle"
                                        },
                    {
                        title: '<span class="time">2016/02/14 08:32</span> David F.',
                        text: "Hi Dave,<br />I was wondering if you can tell me how to " +
                            "setup my new machine.<br />Thanks in advance!",
                        iconCls: "fa fa-circle",
                        collapsed: true
                    },
                    {
                        title: '<span class="time">2016/02/13 14:20</span> Updated Publications',
                        text: "<a href=\"#\"><em>\"3D Rendering in the Web Browser\"</em></a>",
                        iconCls: "fa fa-circle"
                    },
                                        {
                                            title: '<span class="time">2016/02/15 10:35</span> Followed',
                                            text: "By J.R. Simpson",
                                            iconCls: "fa fa-circle"
                                        },
                    {
                        title: '<span class="time">2016/02/14 08:32</span> David F.',
                        text: "Hi Dave,<br />I was wondering if you can tell me how to " +
                            "setup my new machine.<br />Thanks in advance!",
                        iconCls: "fa fa-circle",
                        collapsed: true
                    },
                    {
                        title: '<span class="time">2016/02/13 14:20</span> Updated Publications',
                        text: "<a href=\"#\"><em>\"3D Rendering in the Web Browser\"</em></a>",
                        iconCls: "fa fa-circle"
                    },
                                        {
                                            title: '<span class="time">2016/02/15 10:35</span> Followed',
                                            text: "By J.R. Simpson",
                                            iconCls: "fa fa-circle"
                                        },
                    {
                        title: '<span class="time">2016/02/14 08:32</span> David F.',
                        text: "Hi Dave,<br />I was wondering if you can tell me how to " +
                            "setup my new machine.<br />Thanks in advance!",
                        iconCls: "fa fa-circle",
                        collapsed: true
                    },
                    {
                        title: '<span class="time">2016/02/13 14:20</span> Updated Publications',
                        text: "<a href=\"#\"><em>\"3D Rendering in the Web Browser\"</em></a>",
                        iconCls: "fa fa-circle"
                    },
                    {
                        title: '<span class="time">2016/02/13 11:44</span> Circle',
                        text: "Zaishen Challenge",
                        iconCls: "fa fa-circle"
                    }
                ]
            },
            layout: "centered"
        });
    });
</script>
<style>
    .outer
    {
        max-width: 600px;
        margin: auto;
    }
        .outer .time
        {
            font-weight: normal;
            font-size: 11px;
        }
</style>
</asp:Content>
