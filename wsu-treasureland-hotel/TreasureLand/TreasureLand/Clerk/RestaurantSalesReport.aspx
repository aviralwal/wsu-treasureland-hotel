﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Clerk/Clerkreports.master" AutoEventWireup="true" CodeBehind="RestaurantSalesReport.aspx.cs" Inherits="TreasureLand.Clerk.WebForm8" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <p>
        <asp:Label ID="lblRestaurantSales" runat="server" Font-Size="X-Large" 
            Text="Restaurant Cash Transaction Report"></asp:Label>
        </p> 
    <br />
    <asp:Label ID="lblChooseDate" runat="server" Text="ChooseDates:" 
        style="font-weight: 700"></asp:Label>
    <br />
    <br />
    <asp:Label ID="lblStartDate" runat="server" Text="Begin Date:" 
        style="font-weight: 700"></asp:Label>
    <asp:TextBox ID="txtBeginDate" runat="server"></asp:TextBox>
    <asp:CalendarExtender ID="txtBeginDate_CalendarExtender" runat="server" 
        Enabled="True" TargetControlID="txtBeginDate" Format="d/MM/yyyy" 
        TodaysDateFormat="d MMMM , yyyy">
    </asp:CalendarExtender>
&nbsp;<asp:RequiredFieldValidator ID="rffBeginDate" runat="server" 
        ControlToValidate="txtBeginDate" Display="Dynamic" 
        ErrorMessage="Begin Date is Required" ForeColor="Red" ValidationGroup="vgDate">*</asp:RequiredFieldValidator>
    <asp:CompareValidator ID="cvBeginDate" runat="server" 
        ControlToValidate="txtBeginDate" Display="Dynamic" 
        ErrorMessage="Begin Date must be a date" ForeColor="Red" 
        Operator="DataTypeCheck" Type="Date" ValidationGroup="vgDate">*</asp:CompareValidator>
    &nbsp;
    <asp:Label ID="lblEndDate" runat="server" Text="End Date:" 
        style="font-weight: 700"></asp:Label>
&nbsp;<asp:TextBox ID="txtEndDate" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvEndDate" runat="server" 
        ControlToValidate="txtEndDate" Display="Dynamic" 
        ErrorMessage="End date is required" ForeColor="Red" ValidationGroup="vgDate">*</asp:RequiredFieldValidator>
    <asp:CompareValidator ID="cvEndDate" runat="server" 
        ControlToValidate="txtEndDate" Display="Dynamic" 
        ErrorMessage="End Date must be a date" ForeColor="Red" Operator="DataTypeCheck" 
        Type="Date" ValidationGroup="vgDate">*</asp:CompareValidator>
    <br />
    <asp:Button ID="btnGetTransactions" runat="server" 
        onclick="btnGetTransactions_Click" Text="Get Transactions" 
        ValidationGroup="vgDate" />
    <br />
    <asp:ValidationSummary ID="vsDates" runat="server" ForeColor="Red" 
        ValidationGroup="vgDate" />
    <asp:Label ID="lblPrice" runat="server" Font-Bold="True" 
        Text="Select Order to View:" Visible="False"></asp:Label>
    <br />
    <asp:DropDownList ID="ddlTransactions" runat="server" Visible="False">
    </asp:DropDownList>
    <br />
    <br />
    <asp:CalendarExtender ID="txtEndDate_CalendarExtender" runat="server" 
        Enabled="True" TargetControlID="txtEndDate" Format="d/MM/yyyy" 
        TodaysDateFormat="d MMMM , yyyy">
    </asp:CalendarExtender>
    <asp:Button ID="btnCreateReport" runat="server" onclick="btnCreateReport_Click" 
        Text="Submit" style="height: 26px" Visible="False" />
    <asp:LinqDataSource ID="ldsTransactions" runat="server" 
        ContextTypeName="TreasureLand.DBM.TreasureLandDataClassesDataContext" 
        EntityTypeName="" TableName="ReservationDetailBillings" 
        
        Where="BillingCategoryID == @BillingCategoryID &amp;&amp; BillingItemDate &gt;= @BillingItemDate &amp;&amp; BillingItemDate &lt;= @BillingItemDate2">
        <WhereParameters>
            <asp:Parameter DefaultValue="1" Name="BillingCategoryID" Type="Int16" />
            <asp:ControlParameter ControlID="txtBeginDate" Name="BillingItemDate" 
                PropertyName="Text" Type="DateTime" />
            <asp:ControlParameter ControlID="txtEndDate" Name="BillingItemDate2" 
                PropertyName="Text" Type="DateTime" />
        </WhereParameters>
    </asp:LinqDataSource>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" />
    <asp:SqlDataSource ID="sdsReport" runat="server" 
        ConnectionString="<%$ ConnectionStrings:HotelDB %>" 
        SelectCommand="SELECT LineItem.LineItemAmount, MenuItem.MenuItemName, LineItem.LineItemTransactionID FROM LineItem INNER JOIN MenuItem ON LineItem.MenuItemID = MenuItem.MenuItemID WHERE (LineItem.ReservationDetailBillingID = @RDBID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlTransactions" Name="RDBID" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" 
        Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" 
        Visible="False">
        <LocalReport ReportPath="Clerk\Reports\RestaurantSales.rdlc">
        </LocalReport>
    </rsweb:ReportViewer>
</asp:Content>
