<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ColorTableControl.ascx.cs" Inherits="Uniqlo.AdminPages.AdminProduct.ColorTableControl"%>
<script runat="server">
    public string ColorName { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblColorName.Text = ColorName;
        }
    }

    public void SetColorName(string color)
    {
        ColorName = color;
        lblColorName.Text = color;
    }
</script>

<table class="sizeQtyTable">
 <thead>
     <tr>
          <th><asp:Label ID="lblColorName" runat="server" Text=""></asp:Label></th>
          <th><asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" /></th>
      </tr>
  </thead>
  <tbody>
      <tr>
          <td><asp:TextBox ID="txtSizeS" runat="server" CssClass="form-field" TextMode="Number"></asp:TextBox></td>
          <td></td>
      </tr>                    
      <tr>
          <td><asp:TextBox ID="txtSizeM" runat="server" CssClass="form-field" TextMode="Number"></asp:TextBox></td>
          <td></td>
      </tr>                    
      <tr>
          <td><asp:TextBox ID="txtSizeL" runat="server" CssClass="form-field" TextMode="Number"></asp:TextBox></td>
          <td></td>
      </tr>                    
      <tr>
          <td><asp:TextBox ID="txtSizeXL" runat="server" CssClass="form-field" TextMode="Number"></asp:TextBox></td>
          <td></td>
      </tr>
      <!-- Repeat for other sizes M, L, XL -->
  </tbody>
</table>
