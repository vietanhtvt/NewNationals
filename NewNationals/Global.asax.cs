using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using ClassLibrary.Commons;
using System.IO;

namespace NewNationals
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            //Kiểm tra nếu chưa tồn tại file thì tạo file Count_Visited.txt
            if (!File.Exists(Server.MapPath("Count_Visited.txt")))
                File.WriteAllText(Server.MapPath("Count_Visited.txt"), "0");
            Application["DaTruyCap"] = int.Parse(File.ReadAllText(Server.MapPath("Count_Visited.txt")));

            if (!File.Exists(Server.MapPath("Sum_Visited.txt")))
                File.WriteAllText(Server.MapPath("Sum_Visited.txt"), "0");
            Application["TongSoTruyCap"] = int.Parse(File.ReadAllText(Server.MapPath("Sum_Visited.txt")));
           // Application["thang"] = DateTime.Now.Month;
        }
        void Application_End(object sender, EventArgs e)
        {
        }
        void Application_Error(object sender, EventArgs e)
        {
        }
        protected void Session_Start()
        {
            Session["userid"] = null;
            Session["username"] = null;
            Session["fullname"] = null;
            Session["avatar"] = null;
            Session["email"] = null;
            Session.Add(CommonsHelper.SessionAdminCp, null);
            if (Application["TongSoTruyCap"] == null)
            {
                Application["TongSoTruyCap"] = 1;
            }
            else
            { 
                //CheckMothCurrent((int)Application["thang"]);
                Application["TongSoTruyCap"] = (int)Application["TongSoTruyCap"] + 1;
                // mangstring.
                //File.WriteAllText(Server.MapPath("Month_Visited.txt"), " Tháng " + Application["thang"] + " năm " + DateTime.Now.Year + "co luot truy cap : " + Application["ThangTruyCap"]);
                try
                {
                    File.WriteAllText(Server.MapPath("Sum_Visited.txt"), Application["TongSoTruyCap"].ToString());
                }
                catch 
                {
                }
                
            }
            // Tăng số đang truy cập lên 1 nếu có khách truy cập
            if (Application["DangTruyCap"] == null)
            {
                Application["DangTruyCap"] = 1;
                // Application["ThangTruyCap"] = 1;
            }
            else
            {
                Application["DangTruyCap"] = (int)Application["DangTruyCap"] + 1;
                // Tăng số đã truy cập lên 1 nếu có khách truy cập
                Application["DaTruyCap"] = (int)Application["DaTruyCap"] + 1;
                //      Application["ThangTruyCap"] = (int)Application["ThangTruyCap"] + 1;
                try
                {
                    File.WriteAllText(Server.MapPath("Count_Visited.txt"), Application["DaTruyCap"].ToString());
                }
                catch
                {
                }
                
            }
        }
        void Session_End(object sender, EventArgs e)
        {
            //Khi hết session hoặc người dùng thoát khỏi website thì giảm số người đang truy cập đi 1
            Application["DangTruyCap"] = (int)Application["DangTruyCap"] - 1;
        }
        //void CheckMothCurrent(int month)
        //{
        //    if (DateTime.Now.Month != month)
        //    {
        //        month = DateTime.Now.Month;
        //        Application["ThangTruyCap"] = 0;
        //    }
        //}
    }
}
