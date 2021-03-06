﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using ClassLibrary.Commons;
using ClassLibrary.Models;

namespace ClassLibrary.Services
{
    public interface ISlidehowService
    {
        bool Insert(Slidehow entity);
        bool Update(Slidehow entity);
        bool Delete(int id);

    }
    public class SlidehowService: ISlidehowService
    {
        private readonly DataContext _db = null;

        public SlidehowService()
        {
            _db = new DataContext();
        }

        public bool Insert(Slidehow entity)
        {
            try
            {
                _db.Slidehows.Add(entity);
                _db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                LogSystemService logService = new LogSystemService();
                var logs = new LogSystem();
                logs.IPAddress = CommonsHelper.GetIpAddress;
                logs.CreateDate = DateTime.Now;
                logs.Messenger = "Tài khoản: " + HttpContext.Current.Session[CommonsHelper.SessionAdminCp] + " [Lỗi Thêm Slide]" +
                                 ex.ToString();
                logs.Status = false;
                logService.Insert(logs);
                return false;
            }
        }

        public bool Update(Slidehow entity)
        {
            try
            {
                var slideshow = _db.Slidehows.FirstOrDefault(x => x.Id == entity.Id);
                if (slideshow != null)
                {
                    _db.Entry(slideshow).State = EntityState.Detached;
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
                logs.Messenger = "Tài khoản: " + HttpContext.Current.Session[CommonsHelper.SessionAdminCp] + " [Lỗi Edit Slide]" +
                                 ex.ToString();
                logs.Status = false;
                logService.Insert(logs);
                return false;
            }
        }

        public bool Delete(int id)
        {
            try
            {
                var slide = _db.Slidehows.Find(id);
                if (slide != null)
                {
                     slide.Status = -1;
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
                logs.Messenger = "Tài khoản: " + HttpContext.Current.Session[CommonsHelper.SessionAdminCp] + " [Lỗi Delete Slide]" +
                                 ex.ToString();
                logs.Status = false;
                logService.Insert(logs);
                return false;
            }
        }
        public bool UpdateStatus(int id, int status)
        {
            try
            {
                var entity = _db.Slidehows.Find(id);
                if (entity != null)
                {
                    if (status == 0)
                        entity.Status = 1;
                    if (status == 1)
                        entity.Status = 0;
                    _db.SaveChanges();
                    return true;
                }
                else
                    return false;
            }
            catch (Exception ex)
            {
                LogSystemService logService = new LogSystemService();
                var logs = new LogSystem();
                logs.IPAddress = CommonsHelper.GetIpAddress;
                logs.CreateDate = DateTime.Now;
                logs.Messenger = "Tài khoản: " + HttpContext.Current.Session[CommonsHelper.SessionAdminCp] + " [Lỗi Cập nhật Status Slide]" +
                                 ex.ToString();
                logs.Status = false;
                logService.Insert(logs);
                return false;
            }
        }
        public IEnumerable<Slidehow> ListAllSlide()
        {
            return _db.Slidehows.Where(x => x.Status != -1).OrderBy(x => x.Order).ToList();
        }

        public Slidehow GetSlideById(long id)
        {
            return _db.Slidehows.SingleOrDefault(x => x.Id == id);
        }
       
    }
}
