﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using ClassLibrary.Commons;
using ClassLibrary.Models;

namespace ClassLibrary.Services
{
    public interface IMenuService
    {
        bool Insert(Menu entity);
        bool Update(Menu entity);
        bool Delete(int menuId);
    }

    public class MenuService: IMenuService
    {
        private readonly DataContext _db = null;

        public MenuService()
        {
            _db = new DataContext();
        }

        public bool Insert(Menu entity)
        {
            try
            {
                _db.Menus.Add(entity);
                _db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                LogSystemService logService = new LogSystemService();
                var logs = new LogSystem();
                logs.IPAddress = CommonsHelper.GetIpAddress;
                logs.CreateDate = DateTime.Now;
                logs.Messenger = "Tài khoản: " + HttpContext.Current.Session[CommonsHelper.SessionAdminCp] + " [Lỗi Insert Menu]" +
                                 ex.ToString();
                logs.Status = false;
                logService.Insert(logs);
                return false;
            }
        }

        public bool Update(Menu entity)
        {
            try
            {
                var getmenu = _db.Menus.FirstOrDefault(x => x.Id == entity.Id);
                if (getmenu != null)
                {
                    _db.Entry(getmenu).State = EntityState.Detached;
                }
                _db.Entry(entity).State = EntityState.Modified;
                _db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                LogSystemService logService = new LogSystemService();
                var logs = new LogSystem();
                logs.IPAddress = CommonsHelper.GetIpAddress;
                logs.CreateDate = DateTime.Now;
                logs.Messenger = "Tài khoản: " + HttpContext.Current.Session[CommonsHelper.SessionAdminCp] + " [Lỗi Update Menu]" +
                                 ex.ToString();
                logs.Status = false;
                logService.Insert(logs);
                return false;
            }
        }

        public bool Delete(int menuId)
        {
            try
            {
                var menu = _db.Menus.Find(menuId);
                if (menu != null)
                {
                    _db.Menus.Remove(menu);
                    _db.SaveChanges();
                }
                return true;
            }
            catch (Exception ex)
            {
                LogSystemService logService = new LogSystemService();
                var logs = new LogSystem();
                logs.IPAddress = CommonsHelper.GetIpAddress;
                logs.CreateDate = DateTime.Now;
                logs.Messenger = "Tài khoản: " + HttpContext.Current.Session[CommonsHelper.SessionAdminCp] + " [Lỗi Delete Menu]" +
                                 ex.ToString();
                logs.Status = false;
                logService.Insert(logs);
                return false;
            }
        }
        public IEnumerable<Menu> ListAllMenu()
        {
            return _db.Menus.Where(x => x.ParentId == null).OrderBy(x => x.Order).ToList();
        }
        public IEnumerable<Menu> GetMenuTopParent()
        {
            return _db.Menus.Where(x=>x.ParentId==null).OrderBy(x => x.Order);
        }
        public IEnumerable<Menu> GetMenuTopChild(int menuid)
        {
            return _db.Menus.Where(x => x.ParentId == menuid).OrderBy(x => x.Order);
        }

        public IEnumerable<SelectListItem> GetMenuSelectList()
        {
            var menu = _db.Menus.ToList();
            List<SelectListItem> options = new List<SelectListItem>();
            var parents = menu.Where(x => x.ParentId == null);
            foreach (var parent in parents)
            {
                options.Add(new SelectListItem()
                {
                    Value = parent.Id.ToString(),
                    Text = parent.Name
                });
                var children = menu.Where(x => x.ParentId == parent.Id);
                foreach (var child in children)
                {
                    options.Add(new SelectListItem()
                    {
                        Value = child.Id.ToString(),
                        Text = string.Format("::..{0}", child.Name)
                    });
                    //-----------------------------------------------------------------------------
                    // hien thi menu cap 3
                    var parents3 = menu.Where(x => x.ParentId == child.Id);
                    foreach (var parent3 in parents3)
                    {
                        // Add SelectListItem for the parent
                        options.Add(new SelectListItem()
                        {
                            Value = parent3.Id.ToString(),
                            Text = string.Format("::..::..{0}", parent3.Name)
                        });
                        // hien thi menu cap 4
                        //var children3 = categories.Where(x => x.CategoryParentId == parent3.CategoryId);
                        //foreach (var child3 in children3)
                        //{
                        //    options.Add(new SelectListItem()
                        //    {
                        //        Value = child3.CategoryId.ToString(),
                        //        Text = string.Format("::..::..{0}", child3.CategoryName)
                        //    });
                        //}
                    }
                }
            }
            return options;
        }
        public List<Menu> GetMenuByParent()
        {
            return _db.Menus.Where(x => x.ParentId == null).ToList();
        }
        public Menu GetMenuById(int id)
        {
            return _db.Menus.SingleOrDefault(x => x.Id == id);
        }
        public IEnumerable<Menu> MenuGetByParent(int menuid)
        {
            return _db.Menus.Where(x => x.ParentId == menuid).OrderBy(x => x.Order).ToList();
        }

    }
}
