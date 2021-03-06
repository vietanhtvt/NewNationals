﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ClassLibrary.Commons;
using ClassLibrary.Models;
using ClassLibrary.Services;
using NewNationals.Areas.AdminControlPanel.Models;
using PagedList;

namespace NewNationals.Areas.AdminControlPanel.Controllers
{
    public class MenuController : BaseController
    {
        MenuService menuService = new MenuService();
        PagesService pageService=new PagesService();
        CategoriesService cateService = new CategoriesService();

        // GET: AdminControlPanel/Menu
        public ActionResult Index(int? page, string SearchString)
        {
            int pageNum = page ?? 1;
            var showlist = menuService.ListAllMenu();
            var listslide = new List<Menu>();
            foreach (var item in showlist)
            {
                listslide.Add(new Menu()
                {
                    Id = item.Id,
                    Name = item.Name,
                    TargetUrl = item.TargetUrl,
                    ParentId = item.ParentId,
                    Tanoxomy = item.Tanoxomy,
                    Order = item.Order,
                    stExtension = item.stExtension
                });
            }
            if (!string.IsNullOrEmpty(SearchString))
            {
                showlist = showlist.Where(x => x.Name.Contains(SearchString));
            }
            return View(showlist.ToPagedList(pageNum, 20));
        }
        #region [Insert]
        [HttpGet]
        public ActionResult Create()
        {
            ViewBag.ParentId = menuService.GetMenuSelectList();
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(MenuModels entity)
        {
            ViewBag.ParentId = menuService.GetMenuSelectList();
            if (ModelState.IsValid)
            {
                try
                {
                    var mn = new Menu();
                    mn.Id = 1;
                    mn.Name = entity.Name;
                    mn.TargetUrl = "/" + entity.TargetUrl;
                    mn.ParentId = entity.ParentId;
                    mn.Tanoxomy = "Content";
                    mn.Order = entity.Order;
                    mn.stExtension = entity.stExtension;
                    menuService.Insert(mn);
                    return RedirectToAction("Index", "Menu");
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("", "Lỗi!");
                    return View();
                }
            }
            else
            {
                ModelState.AddModelError("", "Lỗi!");
                return View();
            }
        }
        #endregion
        #region [Update]
        [HttpGet]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var entity = menuService.GetMenuById(int.Parse(id.ToString()));
            if (entity == null)
            {
                return HttpNotFound();
            }
            ViewBag.ParentId = menuService.GetMenuSelectList();
            MenuModels mn = new MenuModels();
            mn.Id = entity.Id;
            mn.Name = entity.Name;
            mn.TargetUrl = entity.TargetUrl;
            mn.ParentId = entity.ParentId;
            mn.Tanoxomy = entity.Tanoxomy;
            mn.Order = entity.Order;
            mn.stExtension = entity.stExtension;
            return View(mn);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(MenuModels entity)
        {
            ViewBag.ParentId = menuService.GetMenuSelectList();
            if (ModelState.IsValid)
            {
                try
                {
                    var mn = new Menu();
                    mn.Id = entity.Id;
                    mn.Name = entity.Name;
                    if (!string.IsNullOrEmpty(entity.TargetUrl))
                        mn.TargetUrl = entity.TargetUrl;
                    else
                    {
                        mn.TargetUrl = "/" ;
                    }
                    mn.ParentId = entity.ParentId;
                    mn.Tanoxomy = "Content";
                    mn.Order = entity.Order;
                    mn.stExtension = entity.stExtension;
                    menuService.Update(mn);
                    return RedirectToAction("Index", "Menu");
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("", "Lỗi!");
                    return View();
                }
            }
            else
            {
                ModelState.AddModelError("", "Lỗi!");
                return View();
            }
        }
        #endregion
        #region [Delete]
        [HttpPost]
        public JsonResult Delete(int id)
        {
            var data = true;
            try
            {
                var menu = menuService.GetMenuById(id);
                if (menu != null)
                {
                    menuService.Delete(id);
                }
            }
            catch (Exception)
            {
                data = false;
            }
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public JsonResult GetUrl(int type, string text)
        {
            var data = "";
            if (type == 1) // cate
            {
                data = "";
                var listcate = cateService.ListAllCategory();
            }
            else if (type == 2)
            {
                data = "";
            }
            else
            {
                data = "";
            }
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        #endregion
        
        [HttpPost]
        public JsonResult GetAutoAll(string input, string gettype)
        {
            if (gettype == "1")
            {
                var listcate = cateService.GetCateAutoComplete(input);
                return Json(listcate, JsonRequestBehavior.AllowGet);
            }
            else if (gettype == "2")
            {
                var listpage = pageService.GetPageAutoComplete(input);
                return Json(listpage, JsonRequestBehavior.AllowGet);
            }
            else
            {
                return Json("", JsonRequestBehavior.AllowGet);
            }
        }
    }
}