<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="Stylesheet" type="text/css" href="Styles/AutoCompleteStyles.css" />
    <script src="Scripts/jquery-1.6.1.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery-ui.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        var input = null;
        function OnTextBoxInit(s, e) {
            //http://jqueryui.com/demos/autocomplete/
            //http://docs.jquery.com/UI/Position
          
            var availableTags = grid.cpVal;
            input = s.GetInputElement();
            $(s.GetInputElement()).autocomplete({
                source: availableTags,
                position:
                {
                    my: "left top",
                    at: "left bottom",
                    of: s.GetMainElement()
                }
            });
        }
        function BeginCallback(s, e) {
            if (input != null) {
                $(input).autocomplete("destroy");
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" SettingsBehavior-AutoFilterRowInputDelay="2000" Settings-ShowFilterRow="true" ClientInstanceName="grid"  OnAutoFilterCellEditorInitialize="ASPxGridView1_AutoFilterCellEditorInitialize" ClientSideEvents-BeginCallback="BeginCallback" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="CategoryID">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="CategoryID" ReadOnly="True" VisibleIndex="0">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CategoryName" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
