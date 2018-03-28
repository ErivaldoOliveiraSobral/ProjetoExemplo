using System.Web.UI.WebControls;

namespace PortalDeFluxos.Core.BLL.Utilitario
{
	public class GridHelper
	{
		public const string ColorRollover = "#FFEAAA";
		public const string ColorOver = "#D2DDEF";
		public const string ColorAlternate = "#FFFFFF";
		public const string Color = "#F1F1F1";

		public void CreatingCustomPaging(ref GridView grid)
		{
			grid.SelectedIndex = -1;

			GridViewRow gvrPager = grid.BottomPagerRow;

			if (gvrPager == null) return;

			DropDownList ddPage = (DropDownList)gvrPager.Cells[0].FindControl("ddlPaginacao");
			Label lblPage = (Label)gvrPager.Cells[0].FindControl("lblPaginacao");
			Label lblPage2 = (Label)gvrPager.Cells[0].FindControl("lblPaginacao1");

			if (ddPage != null)
			{
				for (int i = 0; i < grid.PageCount; i++)
				{
					int intPageNumber = i + 1;

					ListItem lstItem = new ListItem(intPageNumber.ToString());

					if (i == grid.PageIndex)
						lstItem.Selected = true;

					ddPage.Items.Add(lstItem);
				}
			}

			int intCurIndex = grid.PageIndex;

			if (lblPage != null)
				lblPage.Text = grid.PageCount.ToString();

			if (lblPage2 != null)
				lblPage2.Text = (intCurIndex + 1).ToString();


			ImageButton imgFirst = (ImageButton)gvrPager.Cells[0].FindControl("imgFirst");
			ImageButton imgPrevious = (ImageButton)gvrPager.Cells[0].FindControl("imgPrevious");
			ImageButton imgLast = (ImageButton)gvrPager.Cells[0].FindControl("imgLast");
			ImageButton imgNext = (ImageButton)gvrPager.Cells[0].FindControl("imgNext");

			if (intCurIndex == 0)
			{
				imgFirst.Enabled = false;
				imgPrevious.Enabled = false;
				imgFirst.AlternateText = string.Empty;
				imgPrevious.AlternateText = string.Empty;
				imgFirst.ImageUrl = "/Style Library/images/p_First_off.gif";
				imgPrevious.ImageUrl = "/Style Library/images/p_Previous_off.gif";
			}

			if (intCurIndex == (grid.PageCount - 1))
			{
				imgLast.Enabled = false;
				imgNext.Enabled = false;
				imgLast.AlternateText = string.Empty;
				imgNext.AlternateText = string.Empty;
				imgLast.ImageUrl = "/Style Library/images/p_Last_off.gif";
				imgNext.ImageUrl = "/Style Library/images/p_Next_off.gif";
			}

		}

		public void CreatingCustomPagingAccountNumbers(ref GridView grid)
		{
			grid.SelectedIndex = -1;

			GridViewRow gvrPager = grid.BottomPagerRow;

			if (gvrPager == null) return;

			DropDownList ddPage = (DropDownList)gvrPager.Cells[0].FindControl("ddlPaginacao");
			Label lblPage = (Label)gvrPager.Cells[0].FindControl("lblPaginacao");
			Label lblPage2 = (Label)gvrPager.Cells[0].FindControl("lblPaginacao1");

			if (ddPage != null)
			{
				for (int i = 0; i < grid.PageCount; i++)
				{
					int intPageNumber = i + 1;

					ListItem lstItem = new ListItem(intPageNumber.ToString());

					if (i == grid.PageIndex)
						lstItem.Selected = true;

					ddPage.Items.Add(lstItem);
				}
			}

			int intCurIndex = grid.PageIndex;

			if (lblPage != null)
				lblPage.Text = grid.PageCount.ToString();

			if (lblPage2 != null)
				lblPage2.Text = (intCurIndex + 1).ToString();


			ImageButton imgFirst = (ImageButton)gvrPager.Cells[0].FindControl("imgFirst1");
			ImageButton imgPrevious = (ImageButton)gvrPager.Cells[0].FindControl("imgPrevious1");
			ImageButton imgLast = (ImageButton)gvrPager.Cells[0].FindControl("imgLast1");
			ImageButton imgNext = (ImageButton)gvrPager.Cells[0].FindControl("imgNext1");

			if (intCurIndex == 0)
			{
				imgFirst.Enabled = false;
				imgPrevious.Enabled = false;
				imgFirst.AlternateText = string.Empty;
				imgPrevious.AlternateText = string.Empty;
				imgFirst.ImageUrl = "/Style Library/images/p_First_off.gif";
				imgPrevious.ImageUrl = "/Style Library/images/p_Previous_off.gif";
			}

			if (intCurIndex == (grid.PageCount - 1))
			{
				imgLast.Enabled = false;
				imgNext.Enabled = false;
				imgLast.AlternateText = string.Empty;
				imgNext.AlternateText = string.Empty;
				imgLast.ImageUrl = "/Style Library/images/p_Last_off.gif";
				imgNext.ImageUrl = "/Style Library/images/p_Next_off.gif";
			}
		}

		public static void ChangeRowColor(GridViewRowEventArgs e, string colorOver, string colorRow, string colorRowAlternate)
		{

			//Change Row Color
			e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='" + colorOver + "'");

			if (e.Row.RowState == DataControlRowState.Alternate)
			{
				e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='" + colorRowAlternate + "'");
			}
			else
			{
				e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='" + colorRow + "'");
			}

		}

		public void dropPaginacao(ref GridView grid)
		{

			GridViewRow gvrPager = grid.BottomPagerRow;
			DropDownList ddPage = (DropDownList)gvrPager.Cells[0].FindControl("ddPage");
			grid.PageIndex = ddPage.SelectedIndex;

		}

		public enum eAcao
		{
			First = 1,
			Previous = 2,
			Next = 3,
			Last = 4
		}

		public void imgPaginacao(int Acao, ref GridView grid)
		{
			int intCurIndex;

			switch (Acao)
			{
				case (int)eAcao.First:
					grid.PageIndex = 0;
					break;
				case (int)eAcao.Previous:
					intCurIndex = grid.PageIndex;

					if (intCurIndex != 0)
						grid.PageIndex = intCurIndex - 1;
					else
						grid.PageIndex = 0;
					break;
				case (int)eAcao.Next:
					intCurIndex = grid.PageIndex;

					if (intCurIndex != grid.PageCount)
						grid.PageIndex = intCurIndex + 1;
					else
						grid.PageIndex = grid.PageCount;
					break;
				case (int)eAcao.Last:
					grid.PageIndex = grid.PageCount;
					break;
			}
		}
	}
}
