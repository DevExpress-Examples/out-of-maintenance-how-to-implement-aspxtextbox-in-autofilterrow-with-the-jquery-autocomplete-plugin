using DevExpress.Web.ASPxEditors;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        ASPxGridView1.JSProperties["cpVal"] = InitAutoCompleteValues();       
    }
    protected void ASPxGridView1_AutoFilterCellEditorInitialize(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewEditorEventArgs e)
    {
        if (e.Column.FieldName == "CategoryName")
            (e.Editor as ASPxTextBox).ClientSideEvents.Init = "OnTextBoxInit";
    }
    public string[] InitAutoCompleteValues()
    {
        DataView dw = SqlDataSource1.Select(System.Web.UI.DataSourceSelectArguments.Empty) as DataView;
        string[] s = new string[dw.Count];
        for (int i = 0; i < dw.Table.Rows.Count; i++)
        {
            s[i] = dw.Table.Rows[i].ItemArray[1].ToString();
        }
        return s;
    }
}