<%@ Control Language="C#" AutoEventWireup="true" CodeFile="menu_header.ascx.cs" Inherits="web_usercontrol_menu_header" %>
<style>
    .dropdown-item {
        display: block;
        width: 100%;
        padding: 0.25rem 1.5rem;
        clear: both;
        font-weight: 400;
        color: #212529;
        text-align: inherit;
        white-space: nowrap;
        background: 0 0;
        border: 0;
    }

    .dropdown-menu {
            box-shadow: -2px 1px 14px 3px #8181821f;
        overflow: auto;
        background: white;
        font-size: 39px;
        height: 33rem;
        width: 42rem;
        position: absolute;
        transform: translate3d(-160px, 38px, 0px);
        text-align: end;
        top: 2px;
        left: -30rem;
        will-change: transform;
    }

        .dropdown-menu a {
            /* line-height: 1; */
            -webkit-line-clamp: 1;
            -webkit-box-orient: vertical;
            overflow: hidden;
            text-overflow: ellipsis;
            background: none;
            border: none;
        }

    .block-noti {
            padding: 2%;
    border: -1px 6px 17px -4px #80808045;
    border: 1px solid #80808014;
}
    .block-time {
        padding: 0 22px;
        display: flex;
        justify-content: space-between;
    }

        .block-time span {
            font-size: 29px;
            color: #007bff;
        }
        .so{
            font-size: 41px;
    font-weight: 600;
    color: white;
    padding: 11%;
    border-radius: 62px;
        }
</style>
<%--<i style="color: white; font-size: 48px;" class="fa fa-bell  social"><a class="thong-bao">2</a></i>--%>
<div class="dropdown show">
    <i class="fa fa-bell" aria-hidden="true" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="so">2</span></i>
    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
        <asp:Repeater ID="rpThongBao" runat="server">
            <ItemTemplate>
                <div class="block-noti">
                    <a class="dropdown-item" href="<%#Eval("thongbao_link") %>"><%#Eval("thongbao_content") %>
                    </a>
                    <div class="block-time">
                        <span>15/6/2022</span>
                        <span>xem thêm</span>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>

