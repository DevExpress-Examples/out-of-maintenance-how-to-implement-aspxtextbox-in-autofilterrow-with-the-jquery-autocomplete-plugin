Imports Microsoft.VisualBasic
Imports DevExpress.Web
Imports System
Imports System.Collections.Generic
Imports System.Data
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)
		ASPxGridView1.JSProperties("cpVal") = InitAutoCompleteValues()
	End Sub
	Protected Sub ASPxGridView1_AutoFilterCellEditorInitialize(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewEditorEventArgs)
		If e.Column.FieldName = "CategoryName" Then
			TryCast(e.Editor, ASPxTextBox).ClientSideEvents.Init = "OnTextBoxInit"
		End If
	End Sub
	Public Function InitAutoCompleteValues() As String()
		Dim dw As DataView = TryCast(SqlDataSource1.Select(System.Web.UI.DataSourceSelectArguments.Empty), DataView)
		Dim s(dw.Count - 1) As String
		For i As Integer = 0 To dw.Table.Rows.Count - 1
			s(i) = dw.Table.Rows(i).ItemArray(1).ToString()
		Next i
		Return s
	End Function
End Class