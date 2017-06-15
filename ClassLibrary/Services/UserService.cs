using System;
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
    public interface IUserService
    {
        bool Insert(User entity);
        bool Update(User entity);
        bool Delete(int id);

    }
    public class UserService: IUserService
    {
        private readonly DataContext _db = null;

        public UserService()
        {
            _db = new DataContext();
        }

        public bool Insert(User entity)
        {
            try
            {
                _db.Users.Add(entity);
                _db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                LogSystemService logService=new LogSystemService();
                var logs = new LogSystem();
                logs.IPAddress = CommonsHelper.GetIpAddress;
                logs.CreateDate = DateTime.Now;
                logs.Messenger = "Tài khoản: " + HttpContext.Current.Session[CommonsHelper.SessionAdminCp] + " [Lỗi Thêm tài khoản] " +
                                 ex.ToString();
                logs.Status = false;
                logService.Insert(logs);
                return false;
            }
        }

        public bool Update(User entity)
        {
            try
            {
                var user = _db.Users.FirstOrDefault(x => x.Id == entity.Id);
                if (user != null)
                {
                    _db.Entry(user).State = EntityState.Detached;
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
                logs.Messenger = "Tài khoản: " + HttpContext.Current.Session[CommonsHelper.SessionAdminCp] + " [Lỗi Cập nhật tài khoản]" +
                                 ex.ToString();
                logs.Status = false;
                logService.Insert(logs);
                return false;
            }
        }
        public bool UpdateStatus(int userid, int status)
        {
            try
            {
                var entity = _db.Users.Find(userid);
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
            catch(Exception ex)
            {
                LogSystemService logService = new LogSystemService();
                var logs = new LogSystem();
                logs.IPAddress = CommonsHelper.GetIpAddress;
                logs.CreateDate = DateTime.Now;
                logs.Messenger = "Tài khoản: " + HttpContext.Current.Session[CommonsHelper.SessionAdminCp] + " [Lỗi Cập nhật trạng thái tài khoản]" +
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
                var user = _db.Users.Find(id);
                if (user != null)
                {
                    user.Status = -1;
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
                logs.Messenger = "Tài khoản: " + HttpContext.Current.Session[CommonsHelper.SessionAdminCp] + " [Lỗi Xóa tài khoản] " +
                                 ex.ToString();
                logs.Status = false;
                logService.Insert(logs);
                return false;
            }
        }
        public int CheckLogin(string username, string password)
        {
            var ad = _db.Users.SingleOrDefault(x => x.UserName == username && x.Status == 1);
            if (ad == null)
                return 0;
            else
            {
                if (ad.UserPassword == password)
                    return 1;
                else
                    return 0;
            }
        }
        public bool ChangePass(long userid, string password)
        {
            try
            {
                var entity = _db.Users.Find(userid);
                if (entity != null)
                {
                    entity.UserPassword = password;
                    _db.SaveChanges();
                    return true;
                }
                else
                    return false;
            }
            catch
            {
                return false;
            }
        }
        public bool UserNameExits(string input)
        {
            return _db.Users.Any(x => x.UserName == input);
        }
        public List<User> ListAllUser()
        {
            return _db.Users.Where(x => x.Status != -1).ToList();
        }
        public User GetUserById(int id)
        {
            return _db.Users.SingleOrDefault(x => x.Id == id);
        }
        public User GetUserByUserName(string username)
        {
            return _db.Users.SingleOrDefault(x => x.UserName == username);
        }
    }
}
