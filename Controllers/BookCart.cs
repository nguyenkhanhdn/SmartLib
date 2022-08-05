using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace SmartLib.Controllers
{
    public class BookCart
    {  
        // public properties
        public DataTable CartItems;
       
        // default constructor/ Giỏ sách mới
        public BookCart()
        {
            // create an empty shopping cart
            // create an empty DataTable to hold the cart items
            this.CartItems = new DataTable("books");
            this.CartItems.Columns.Add(new DataColumn("bookId", Type.GetType("System.String")));
            this.CartItems.Columns.Add(new DataColumn("title", Type.GetType("System.String")));
            this.CartItems.Columns.Add(new DataColumn("quantity", Type.GetType("System.Int32")));
        }
        //Xóa bỏ cuốn sách khỏi giỏ sách với mã sách
        public void RemoveItem(string bookId)
        {
            DataRow[] rows = this.CartItems.Select("bookId='" + bookId + "'");
            if (rows.Length > 0)
            {
                this.CartItems.Rows.Remove(rows[0]);
            }
        }
        //Thêm sách mới vào giỏ
        // add an item to the cart
        public void AddItem(String bookId, String title, int quantity)
        {
            if (!IsExistItem(bookId))
            {
                // create new DataTable row and populate with values - Hàng mới
                DataRow row = this.CartItems.NewRow();
                row["bookId"] = bookId;
                row["title"] = title;
                row["quantity"] = quantity;
                // add row to DataTable update total value
                this.CartItems.Rows.Add(row);
            }            
        }
        public bool IsExistItem(string bookId)
        {
            bool b = false;
            if (this.CartItems.Rows.Count > 0)
            {
                for (int i = 0; i < this.CartItems.Rows.Count; i++)
                {
                    if (this.CartItems.Rows[i]["bookId"].Equals(bookId))
                    {
                        b = true;
                        break;//Thoat vong lap
                    }
                }
            }
            return b;
        }
        // empty the cart by clearing the DataTable
        public void Clear()
        {
            this.CartItems.Rows.Clear();
        }
    }
}