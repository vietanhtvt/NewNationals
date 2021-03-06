﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using ClassLibrary.Commons;
using ClassLibrary.Models;

namespace ClassLibrary.Services
{
    public interface ITagService
    {
        bool Insert(Tag entity);
        bool Update(Tag entity);
        bool Delete(List<Tag> lst);

    }
    public class TagService: ITagService
    {
        private readonly DataContext _db = null;

        public TagService()
        {
            _db = new DataContext();
        }

        public bool Insert(Tag entity)
        {
            try
            {
                _db.Tags.Add(entity);
                _db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                LogSystemService logService = new LogSystemService();
                var logs = new LogSystem();
                logs.IPAddress = CommonsHelper.GetIpAddress;
                logs.CreateDate = DateTime.Now;
                logs.Messenger = "Tài khoản: " + HttpContext.Current.Session[CommonsHelper.SessionAdminCp] + " [Lỗi Insert Tag]" +
                                 ex.ToString();
                logs.Status = false;
                logService.Insert(logs);
                return false;
            }
        }

        public bool Update(Tag entity)
        {
            try
            {
                var tag = _db.Tags.FirstOrDefault(x => x.PageId == entity.PageId);
                if (tag != null)
                {
                    _db.Entry(tag).State = EntityState.Detached;
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
                logs.Messenger = "Tài khoản: " + HttpContext.Current.Session[CommonsHelper.SessionAdminCp] + " [Lỗi Update Tag]" +
                                 ex.ToString();
                logs.Status = false;
                logService.Insert(logs);
                return false;
            }
        }

        public bool Delete(List<Tag> lst)
        {
            try
            {
                    _db.Tags.RemoveRange(lst);
                    _db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                LogSystemService logService = new LogSystemService();
                var logs = new LogSystem();
                logs.IPAddress = CommonsHelper.GetIpAddress;
                logs.CreateDate = DateTime.Now;
                logs.Messenger = "Tài khoản: " + HttpContext.Current.Session[CommonsHelper.SessionAdminCp] + " [Lỗi Delete Tag]" +
                                 ex.ToString();
                logs.Status = false;
                logService.Insert(logs);
                return false;
            }
        }
        public List<Tag> ListTagById(long id)
        {
            return _db.Tags.Where(x => x.PageId == id).ToList();
        }
        public List<Tag> ListTagsGetByPageId(long? id)
        {
            return _db.Tags.Where(x => x.PageId == id).ToList();
        }
        public int CountTags(string name)
        {
            return _db.Tags.Where(x => x.stTag == name).Count();
        }
    }
}
