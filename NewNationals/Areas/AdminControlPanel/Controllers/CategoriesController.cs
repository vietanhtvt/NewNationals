﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ClassLibrary.Models;
using ClassLibrary.Services;
using ClassLibrary.Commons;
using NewNationals.Areas.AdminControlPanel.Models;

namespace NewNationals.Areas.AdminControlPanel.Controllers
{
    public class CategoriesController : BaseController
    {
        CategoriesService cateService=new CategoriesService();
        // GET: AdminControlPanel/Categories
        public ActionResult Index()
        {
            var list = cateService.ListAllCategory();
            return View(list);
        }
        #region [Insert]
        [HttpGet]
        public ActionResult Create()
        {
            ViewBag.ParentId = cateService.GetCategoriesSelectList();
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(CategoriesModels entity)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    ViewBag.ParentId = cateService.GetCategoriesSelectList();
                    //if (!cateService.CategoryNameExits(CommonsHelper.FilterCharCommas(entity.Name)))
                    //{
                        var cate = new Category();
                        cate.Id = 1;
                        cate.Name = entity.Name;
                        if (!string.IsNullOrEmpty(entity.GeTargettUrl))
                        {
                            cate.Url = CommonsHelper.FilterCharCommas(entity.GeTargettUrl);
                        }
                        else
                        {
                            cate.Url = CommonsHelper.FilterCharCommas(entity.Name);
                        }
                   
                        cate.Note = entity.Note;
                        cate.Title = entity.Taxanomy;
                        cate.Keyword = entity.Keyword;
                        cate.Description = entity.Description;
                        cate.Status = entity.Status;
                        cate.ParentId = entity.ParentId;
                        cate.taxanomy = entity.Taxanomy;
                        cateService.Insert(cate);
                    //-------------------------------------------------------------------------------
                    // cập nhật lại url
                    if (string.IsNullOrEmpty(entity.GeTargettUrl))
                    {
                        long getid = cate.Id;
                        string geturl = cate.Url + "-" + getid;
                        cateService.UpdateUrl(getid, geturl);
                    }
                    
                        return RedirectToAction("Index", "Categories");
                    //}
                    //else
                    //{
                    //    ModelState.AddModelError("", "Lỗi: chuyên mục đã tồn tại!");
                    //    return View();
                    //}
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
            var entity = cateService.GetCategoryById(int.Parse(id.ToString()));
            if (entity == null)
            {
                return HttpNotFound();
            }
            ViewBag.ParentId = cateService.GetCategoriesSelectList();
            CategoriesModels cate = new CategoriesModels();
            cate.Id = entity.Id;
            cate.Name = entity.Name;
            cate.Url = CommonsHelper.FilterCharCommas(entity.Title);
            cate.Note = entity.Note;
            cate.Title = entity.taxanomy;
            cate.Keyword = entity.Keyword;
            cate.Description = entity.Description;
            cate.Status = entity.Status;
            cate.ParentId = entity.ParentId;
            cate.Taxanomy = entity.taxanomy;
            return View(cate);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(CategoriesModels entity)
        {
            ViewBag.ParentId = cateService.GetCategoriesSelectList();
            if (ModelState.IsValid)
            {
                try
                {
                    var cate = new Category();
                    cate.Id = entity.Id;
                    cate.Name = entity.Name;
                    if (!string.IsNullOrEmpty(entity.GeTargettUrl))
                    {
                        cate.Url = CommonsHelper.FilterCharCommas(entity.GeTargettUrl);
                    }
                    else
                    {
                        cate.Url = CommonsHelper.FilterCharCommas(entity.Name) + "-" + entity.Id;
                    }
                    cate.Note = entity.Note;
                    cate.Title = entity.Taxanomy;
                    cate.Keyword = entity.Keyword;
                    cate.Description = entity.Description;
                    cate.Status = entity.Status;
                    cate.ParentId = entity.ParentId;
                    cate.taxanomy = entity.Taxanomy;
                    cateService.Update(cate);
                    return RedirectToAction("Index", "Categories");
                }
                catch (Exception)
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
                var category = cateService.GetCategoryById(id);
                if (category != null)
                {
                    cateService.Delete(id);
                }
            }
            catch (Exception)
            {
                data = false;
            }
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        #endregion
        #region [Update Status]
        [HttpPost]
        public JsonResult UpdateStatus(int id, int status)
        {
            var data = true;
            try
            {
                var category = cateService.GetCategoryById(id);
                if (category != null)
                {
                    cateService.UpdateStatus(id, status);
                }
            }
            catch (Exception)
            {
                data = false;
            }
            return Json(data, JsonRequestBehavior.AllowGet);
        }
        #endregion
        PagesService pageService = new PagesService();
        [HttpPost]
        public JsonResult GetAutoAll(string input, string gettype)
        {
            if (gettype == "1")
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