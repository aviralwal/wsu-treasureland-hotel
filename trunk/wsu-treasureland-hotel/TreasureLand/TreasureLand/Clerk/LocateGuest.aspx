﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Clerk/ClerkMasterPage.master" AutoEventWireup="true" CodeBehind="LocateGuest.aspx.cs" Inherits="TreasureLand.Clerk.LocateGuest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:MultiView ID="mvLocateGuest" runat="server" ActiveViewIndex="0">
        <asp:View ID="vLocateGuest" runat="server">
            <table class="style1" style="width: 676px">
                <tr>
                    <td class="style18">
                        Reservation #:</td>
                    <td class="style24">
                        <asp:TextBox ID="txtReservationNum" runat="server"></asp:TextBox>
                    </td>
                    <td class="style12" style="width: 80px">
                        First Name:</td>
                    <td class="style22" style="width: 136px">
                        <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                    </td>
                    <td class="style13">
                        <asp:Label ID="lblErrorMessageMissingData" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style19">
                        Room #:</td>
                    <td class="style25">
                        <asp:TextBox ID="txtRoomNum" runat="server"></asp:TextBox>
                    </td>
                    <td class="style4" style="width: 80px">
                        Surname:</td>
                    <td class="style23" style="width: 136px">
                        <asp:TextBox ID="txtSurname" runat="server"></asp:TextBox>
                    </td>
                    <td class="style5">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style19">
                        <asp:Button ID="btnLocateGuest" runat="server" 
                            Text="Locate Guest" ValidationGroup="lookup" OnClick="btnLocateGuest_Click" />
                    </td>
                    <td class="style25">
                        &nbsp;</td>
                    <td class="style4" style="width: 80px">
                        Email:</td>
                    <td class="style23" style="width: 136px">
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                    </td>
                    <td class="style5">
                        <asp:Label ID="lblErrorMessageNoCustomersFound" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="gvGuest" runat="server" AutoGenerateColumns="False" CellPadding="4" 
                                    onselectedindexchanged="gvGuest_SelectedIndexChanged" 
                    onselectedindexchanging="gvGuest_SelectedIndexChanging" 
                ForeColor="#333333" GridLines="None" 
                >
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                    <asp:BoundField DataField="ReservationID" HeaderText="Reservation #" 
                        InsertVisible="False" ReadOnly="True" SortExpression="ReservationID" />
                    <asp:BoundField DataField="GuestFirstName" HeaderText="First Name" 
                        SortExpression="GuestFirstName" />
                    <asp:BoundField DataField="GuestSurName" HeaderText="Surname" 
                        SortExpression="GuestSurName" />
                    <asp:BoundField DataField="GuestEmail" HeaderText="Email"
                        InsertVisible="False" ReadOnly="True"  />
                </Columns>
                <RowStyle BackColor="#EFF3FB" Font-Size="Small" />
                <EditRowStyle BackColor="#2461BF" />
                <SelectedRowStyle BackColor="CornflowerBlue" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="Blue" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="Blue" Font-Bold="True" Font-Names="Arial" Font-Size="Small"
                    ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <br />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnSelectGuest" runat="server" 
                Text="Select Guest" onclick="btnSelectGuest_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblErrorMessage2" runat="server" ForeColor="Red"></asp:Label>
        </asp:View>
        <asp:View ID="vCheckInGuest" runat="server">
            <table style="width: 78%">
                <tr>
                    <td style="width: 133px">
                        Reservation Number:</td>
                    <td class="style1" style="width: 156px">
                        <asp:TextBox ID="txtShowReservationNum" runat="server" ReadOnly="True"></asp:TextBox>
                    </td>
                    <td style="width: 99px">
                        First Name:</td>
                    <td style="width: 134px">
                        <asp:TextBox ID="txtShowFirstName" runat="server" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 133px">
                        Room Type:</td>
                    <td class="style1" style="width: 156px">
                        <asp:TextBox ID="txtShowRoomType" runat="server" ReadOnly="True"></asp:TextBox>
                    </td>
                    <td style="width: 99px">
                        Surname:</td>
                    <td style="width: 134px">
                        <asp:TextBox ID="txtShowSurname" runat="server" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 133px">
                        Room Number:</td>
                    <td class="style1" style="width: 156px">
                        <asp:TextBox ID="txtShowRoomNumber" runat="server" ReadOnly="True"></asp:TextBox>
                    </td>
                    <td style="width: 99px">
                        Phone Number:</td>
                    <td style="width: 134px">
                        <asp:TextBox ID="txtShowPhone" runat="server" ReadOnly="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 133px">
                        Check out:</td>
                    <td class="style1" style="width: 156px">
                        <asp:TextBox ID="txtShowCheckOut" runat="server" ReadOnly="True"></asp:TextBox>
                    </td>
                    <td style="width: 99px">
                        Email:</td>
                    <td style="width: 134px">
                        <asp:TextBox ID="txtShowEmail" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 133px">
                        Number of Guests</td>
                    <td class="style1" style="width: 156px">
                        <asp:TextBox ID="txtShowNumGuests" runat="server" ReadOnly="True"></asp:TextBox>
                    </td>
                    <td style="width: 99px">
                        &nbsp;</td>
                    <td style="width: 134px">
                        &nbsp;</td>
                </tr>
            </table>
            <br />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnBack" runat="server" Text="Back" 
                CommandName="PrevView" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnCheckIn" runat="server" Text="Check in" 
                onclick="btnCheckIn_Click" />
        </asp:View>
    </asp:MultiView>
    <br />
    <br />
</asp:Content>