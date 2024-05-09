using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using static Uniqlo.Image;
using static Uniqlo.Product;

namespace Uniqlo
{
    public class ImageHandler : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            try
            {
                int imageId = int.Parse(context.Request.QueryString["id"]);
                byte[] imageData = GetImageData(imageId);

                if (imageData != null && imageData.Length > 0)
                {
                    context.Response.ContentType = "image/jpeg"; // Adjust content type based on the actual image format
                    context.Response.BinaryWrite(imageData);
                }
                else
                {
                    context.Response.StatusCode = 404; // Not found
                }
            }
            catch
            {
                context.Response.StatusCode = 500; // Internal Server Error
            }
        }
        private byte[] GetImageData(int imageId)
        {
            using (var context = new ImageDbContext())
            {
                var image = context.Image.FirstOrDefault(i => i.Image_ID == imageId);
                return image?.ProductImage;
            }
        }

        public bool IsReusable
        {
            get { return false; }
        }
    }

   
}