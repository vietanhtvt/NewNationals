﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Security.AccessControl;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using ClassLibrary.Models;
using ClassLibrary.Services;

namespace ClassLibrary.Commons
{
       
    public class CommonsHelper
    {
        public static string SessionAdminCp = "SessionAdminCPLogin";


        public static IEnumerable<SelectListItem> Template_BaiViet()
        {
            var temp = new List<SelectListItem>
            {
                new SelectListItem { Text = "Chọn template", Value = "0" },
                new SelectListItem { Text = "Không hiển thị chuyên mục bên phải (cho dạng bản đồ)", Value = "NOT_CATEGORY"},
            };
            return temp;
        }

       
        public static IEnumerable<SelectListItem> Dropdown_Status()
        {
            var getStatus = new List<SelectListItem>
            {
                new SelectListItem { Text = "Bật", Value = "1" },
                new SelectListItem { Text = "Tắt", Value = "0"}
            };
            return getStatus;
        }

       
        public static IEnumerable<SelectListItem> Dropdown_TypeTargetUrl()
        {
            var getStatus = new List<SelectListItem>
            {
                new SelectListItem { Text = "Không có đường dẫn", Value = "0" },
                new SelectListItem { Text = "Lấy đường dẫn từ Chuyên mục", Value = "1"},
                new SelectListItem { Text = "Lấy đường dẫn từ Bài viết", Value = "2"},
            };
            return getStatus;
        }
        public static IEnumerable<SelectListItem> Dropdown_CategoriesTaxanomy()
        {
            var getStatus = new List<SelectListItem>
            {
                new SelectListItem { Text = "Mặc định", Value = "" },
                new SelectListItem { Text = "Menu phải cấp cuối trong 5 TIỂU BAN TAI NẠN GIAO THÔNG", Value = "LEFTMENU_1"},
                new SelectListItem { Text = "Menu bên phải trong các bài viết [KHÔNG] thuộc 5 TIỂU BAN TAI NẠN GIAO THÔNG", Value = "LEFTMENU_2"}
                //new SelectListItem { Text = "Menu bên phải trong dạng bài viết thuộc TAI NẠN GIAO THÔNG ", Value = "LEFTMENU_1"},
            };
            return getStatus;
        }
        public static IEnumerable<SelectListItem> Dropdown_PageTaxanomy()
        {
            var getStatus = new List<SelectListItem>
            {
                new SelectListItem { Text = "Dạng bài viết Tai nạn khác", Value = "BaiViet_KHAC"},
                new SelectListItem { Text = "Dạng bài viết thuộc 5 TIỂU BAN TAI NẠN GIAO THÔNG ", Value = "BaiViet_TNGT"},
            };
            return getStatus;
        }

      
        public static IEnumerable<SelectListItem> Dropdown_Gender()
        {
            var getStatus = new List<SelectListItem>
            {
                new SelectListItem { Text = "Nam", Value = "True" },
                new SelectListItem { Text = "Nữ", Value = "False"}
            };
            return getStatus;
        }
        public static IEnumerable<SelectListItem> Categories_TypeTargetUrl()
        {
            var getStatus = new List<SelectListItem>
            {
                new SelectListItem { Text = "Tự động tạo đường dẫn", Value = "0" },
                new SelectListItem { Text = "Lấy đường dẫn từ bài viết có sẵn", Value = "1"},
            };
            return getStatus;
        }
      
        public static IEnumerable<SelectListItem> TypeCategory()
        {
            var getStatus = new List<SelectListItem>
            {
                new SelectListItem { Text = "Menu Trên", Value = "1" },
                new SelectListItem { Text = "Menu Dưới", Value = "2" },
                new SelectListItem { Text = "Menu Trong", Value = "3"}
            };
            return getStatus;
        }
       
        public static IEnumerable<SelectListItem> StatusAccount()
        {
            var getStatus = new List<SelectListItem>
            {
                new SelectListItem { Text = "Cho phép", Value = "1"},
                new SelectListItem { Text = "Không cho phép", Value = "0" },
            };
            return getStatus;
        }
        public static IEnumerable<SelectListItem> TargetDropdown()
        {
            var getStatus = new List<SelectListItem>
            {
                new SelectListItem { Text = "Mở cửa sổ mới", Value = "_blank"},
                new SelectListItem { Text = "Mở trong Tab hiện tại", Value = "_self" },
                new SelectListItem { Text = "Mở trong cửa sổ cha", Value = "_parent" }
            };
            return getStatus;
        }
        public static IEnumerable<SelectListItem> PositionType()
        {
            var getStatus = new List<SelectListItem>
            {
                new SelectListItem { Text = "Top", Value = "1" },
                new SelectListItem { Text = "Bottom", Value = "2" },
                new SelectListItem { Text = "Inside", Value = "3"}
            };
            return getStatus;
        }

        public static string RutGon(string value, int count)
        {
            if (string.IsNullOrEmpty(value))
                return value;
            try
            {
                string values = value;
                if (values.Length >= count)
                {
                    string valueCut = values.Substring(0, count - 3);
                    string[] valuearray = valueCut.Split(' ');
                    string valuereturn = "";
                    for (int i = 0; i < valuearray.Length - 1; i++)
                    {
                        valuereturn = valuereturn + " " + valuearray[i];
                    }
                    return valuereturn + "...";
                }
                else
                {
                    return values;
                }
            }
            catch
            {
                return "";
            }
            
        }

        public static string FilterCharCommas(string ipStrChange)
        {
            if (string.IsNullOrEmpty(ipStrChange))
                return "";
            Regex vRegRegex = new Regex("\\p{IsCombiningDiacriticalMarks}+");
            string vStrFormD = ipStrChange.Normalize(System.Text.NormalizationForm.FormD);
            string rt = vRegRegex.Replace(vStrFormD, String.Empty).Replace('\u0111', 'd').Replace('\u0110', 'D').Replace(" ", "-").Replace("/", "-");
            rt = rt.Replace("\\", "-").Replace("'", "-").Replace(":", "-").Replace("&", "-").Replace(".", "").Replace(":", "-").Replace("%", "phan-tram").Replace("?", "-").Replace("\"", "-");
            return rt.ToLower();
        }

        public static string EncrytPassword(string input)
        {
            var md5 = new MD5CryptoServiceProvider();
            md5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(input));
            byte[] result = md5.Hash;

            StringBuilder strBuilder = new StringBuilder();
            for (int i = 0; i < result.Length; i++)
            {
                strBuilder.Append(result[i].ToString("x5"));
            }
            return strBuilder.ToString().ToUpper();
        }
        public static string GetIpAddress
        {
            get
            {
                HttpRequest currentRequest = HttpContext.Current.Request;
                string ipAddress = currentRequest.ServerVariables["HTTP_X_FORWARDED_FOR"];

                if (ipAddress == null || ipAddress.ToLower() == "unknown")
                    ipAddress = currentRequest.ServerVariables["REMOTE_ADDR"];

                return ipAddress;
            }
        }

        public static string GetPlatform
        {
            get
            {
                return HttpContext.Current.Request.Browser.Platform;
            }
        }
        public static string genCaptchar()
        {
            Random random = new Random();
            string chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVXYZ";
            StringBuilder builder = new StringBuilder();
            char ch;
            for (int i = 0; i < 6; i++)
            {
                ch = chars[random.Next(chars.Length)];
                builder.Append(ch);
            }
            return builder.ToString();
        }
        public static string formatDate(DateTime date)
        {
            int month = date.Month;
            int day = date.Day;
            string stmonth = "";
            switch (month)
            {
                case 1:
                    stmonth += "Tháng 1";
                    break;
                case 2:
                    stmonth += "Tháng 2";
                    break;
                case 3:
                    stmonth += "Tháng 3";
                    break;
                case 4:
                    stmonth += "Tháng 4";
                    break;
                case 5:
                    stmonth += "Tháng 5";
                    break;
                case 6:
                    stmonth += "Tháng 6";
                    break;
                case 7:
                    stmonth += "Tháng 7";
                    break;
                case 8:
                    stmonth += "Tháng 8";
                    break;
                case 9:
                    stmonth += "Tháng 9";
                    break;
                case 10:
                    stmonth += "Tháng 10";
                    break;
                case 11:
                    stmonth += "Tháng 11";
                    break;
                case 12:
                    stmonth += "Tháng 12";
                    break;
            }
            return "<div class=\"date\"><div class=\"day\">" + day + "</div>" + stmonth + "</div>";
        }

        public static string VietHoaKyTuDauTien(string str)
        {
            if (string.IsNullOrEmpty(str))
                return str;
            try
            {
                string result = "";
                result += str.Trim().Substring(0, 1).ToUpper() + str.Trim().Substring(1).ToLower();
                return result.Trim();
            }
            catch
            {
                return "";
            }
        }
        public string deCode(string stInput)
        {
            try
            {
                string EncryptionKey = "123456789";
                byte[] cipherBytes = Convert.FromBase64String(stInput);
                using (Aes encryptor = Aes.Create())
                {
                    Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                    encryptor.Key = pdb.GetBytes(32);
                    encryptor.IV = pdb.GetBytes(16);
                    using (MemoryStream ms = new MemoryStream())
                    {
                        using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                        {
                            cs.Write(cipherBytes, 0, cipherBytes.Length);
                            cs.Close();
                        }
                        stInput = Encoding.Unicode.GetString(ms.ToArray());
                    }
                }
                return stInput;
            }
            catch (Exception ex)
            {
                string get = ex.ToString();
                return null;
            }

        }
        public static int SendEmailSystem(string MemberTo, string MemberFrom, string _Subject, string _body)
        {
            try
            {
                SettingService settingService = new SettingService();
                var getemail = settingService.GetSettings("EMAIL_SEND");
                var getpassemail = settingService.GetSettings("PASS_EMAIL_SEND");
                string get = new CommonsHelper().deCode(getpassemail.stValue);
                MailMessage mail = new MailMessage();
                mail.To.Add(MemberTo);
                mail.From = new MailAddress(MemberFrom);
                mail.Subject = _Subject;
                string Body = _body;
                mail.Body = Body;
                mail.IsBodyHtml = true;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new System.Net.NetworkCredential(getemail.stValue, new CommonsHelper().deCode(getpassemail.stValue));
                smtp.EnableSsl = true;
                smtp.Send(mail);
                return 1;
            }
            catch (Exception ex)
            {
                LogSystemService logService = new LogSystemService();
                var logs = new LogSystem();
                logs.IPAddress = CommonsHelper.GetIpAddress;
                logs.CreateDate = DateTime.Now;
                logs.Messenger = "Tài khoản: " + HttpContext.Current.Session[CommonsHelper.SessionAdminCp] + " [Send Email Error:]" +
                                 ex.ToString();
                logs.Status = false;
                logService.Insert(logs);
                return 0;
            }
        }
    }
}

