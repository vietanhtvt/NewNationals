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
    public interface IRoleService
    {
        bool Insert(Role entity);
        bool Update(Role entity);
        bool Delete(int id);

    }
    public class RoleService:IRoleService
    {
        private readonly DataContext _db = null;

        public RoleService()
        {
            _db = new DataContext();
        }

        public bool Insert(Role entity)
        {
            try
            {
                _db.Roles.Add(entity);
                _db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                LogSystemService logService = new LogSystemService();
                var logs = new LogSystem();
                logs.IPAddress = CommonsHelper.GetIpAddress;
                logs.CreateDate = DateTime.Now;
                logs.Messenger = "Tài khoản: " + HttpContext.Current.Session[CommonsHelper.SessionAdminCp] + " [Lỗi Thêm mới Role]" +
                                 ex.ToString();
                logs.Status = false;
                logService.Insert(logs);
                return false;
            }
        }

        public bool Update(Role entity)
        {
            try
            {
                var role = _db.Roles.FirstOrDefault(x => x.Id == entity.Id);
                if (role != null)
                {
                    _db.Entry(role).State = EntityState.Detached;
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
                logs.Messenger = "Tài khoản: " + HttpContext.Current.Session[CommonsHelper.SessionAdminCp] + " [Lỗi Update Role]" +
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
                var role = _db.Roles.Find(id);
                if (role != null)
                {
                    _db.Roles.Remove(role);
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
                logs.Messenger = "Tài khoản: " + HttpContext.Current.Session[CommonsHelper.SessionAdminCp] + " [Lỗi Delete Role]" +
                                 ex.ToString();
                logs.Status = false;
                logService.Insert(logs);
                return false;
            }
        }

        public IEnumerable<Role> ListAllRole()
        {
            return _db.Roles.ToList();
        }
        public bool RoleNameExits(string input)
        {
            return _db.Roles.Any(x => x.RoleName == input);
        }

        public Role GetRoleById(int? id)
        {
            return _db.Roles.SingleOrDefault(x => x.Id == id);
        }
        public List<Role> GetRoleList()
        {
            return _db.Roles.ToList();
        }
    }
}
