﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ClassLibrary.Commons;
using ClassLibrary.Services;
using ClassLibrary.Models;
using NewNationals.Areas.AdminControlPanel.Models;
using PagedList;

namespace NewNationals.Areas.AdminControlPanel.Controllers
{
    public class ContactController : BaseController
    {
        ContactService contact=new ContactService();
        // GET: AdminControlPanel/Contact
        public ActionResult Index(int? page, string SearchString, string FromDate, string ToDate)
        {
            int pageNum = page ?? 1;
            var showlist = contact.ListAllContact();
            var listslide = new List<Contact>();
            foreach (var item in showlist)
            {
                listslide.Add(new Contact()
                {
                    Id = item.Id,
                    Email = item.Email,
                    Title = item.Title,
                    Content = item.Content,
                    CreateDate = item.CreateDate,
                    Status = item.Status
                });
            }
            if (!string.IsNullOrEmpty(SearchString))
            {
                showlist = showlist.Where(x => x.Email.Contains(SearchString) || x.Title.Contains(SearchString) || x.Content.Contains(SearchString));
            }
            try
            {
                if (!string.IsNullOrEmpty(FromDate))
                {
                    if (!FromDate.Trim().Equals(string.Empty))
                    {
                        showlist = showlist.Where(x => x.CreateDate.Date >= DateTime.Parse(FromDate).Date);
                    }
                }
            }
            catch
            {
            }
            try
            {
                if (!string.IsNullOrEmpty(ToDate))
                {
                    if (!ToDate.Trim().Equals(string.Empty))
                    {
                        showlist = showlist.Where(x => x.CreateDate.Date <= DateTime.Parse(ToDate).Date);
                    }
                }
            }
            catch
            {
            }
            return View(showlist.ToPagedList(pageNum, 30));
        }
        #region [Delete]
        [HttpPost]
        public JsonResult Delete(long id)
        {
            var data = true;
            try
            {
                var ct = contact.GetContactById(id);
                if (ct != null)
                {
                    contact.Delete(id);
                }
            }
            catch (Exception)
            {
                data = false;
            }
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        #endregion

        #region [Accept]
        [HttpPost]
        public JsonResult Accept(long id)
        {
            var data = true;
            try
            {
                var ct = contact.GetContactById(id);
                if (ct != null)
                {
                    contact.UpdateStatus(id, 1);
                }
            }
            catch (Exception)
            {
                data = false;
            }
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        #endregion
        #region [Desagree]
        [HttpPost]
        public JsonResult Desagree(long id)
        {
            var data = true;
            try
            {
                var ct = contact.GetContactById(id);
                if (ct != null)
                {
                    contact.UpdateStatus(id, 0);
                }
            }
            catch (Exception)
            {
                data = false;
            }
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        #endregion
    }
}