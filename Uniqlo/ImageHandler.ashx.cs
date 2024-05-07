using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using static Uniqlo.Product;

namespace Uniqlo
{
    /// <summary>
    /// Summary description for ImageHandler
    /// </summary>
    public class ImageHandler : IHttpHandler
    {
        public byte[] GetImageData(int imageId)
        {
            using (var context = new ProductDbContext())  // Use your DbContext
            {
                var image = context.Image.FirstOrDefault(i => i.Image_ID == imageId);
                return image?.ImagePath;
            }
        }
        public void ProcessRequest(HttpContext context)
        {
            int imageId = Convert.ToInt32(context.Request.QueryString["id"]);
            byte[] imageData = GetImageData(imageId);

            if (imageData != null)
            {
                context.Response.ContentType = "image/png"; // Set the appropriate content type
                context.Response.BinaryWrite(imageData);
            }
            else
            {
                context.Response.StatusCode = 404;
            }
        }

        public bool IsReusable
        {
            get { return false; }
        }
    }
}