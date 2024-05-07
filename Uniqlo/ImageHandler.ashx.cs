using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using static Uniqlo.Product;

namespace Uniqlo
{
    public class ImageHandler : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            int imageId = Convert.ToInt32(context.Request.QueryString["id"]);
            byte[] imageData = GetImageData(imageId);

            if (imageData != null)
            {
                context.Response.ContentType = "image/jpeg"; // Assuming JPEG format; adjust as necessary
                context.Response.BinaryWrite(imageData);
            }
            else
            {
                context.Response.StatusCode = 404;
            }
        }

        public byte[] GetImageData(int imageId)
        {
            using (var db = new ProductDbContext())
            {
                var image = db.Image.FirstOrDefault(i => i.Image_ID == imageId);
                return image?.ImagePath;
            }
        }

        public bool IsReusable
        {
            get { return true; }
        }
    }

   
}