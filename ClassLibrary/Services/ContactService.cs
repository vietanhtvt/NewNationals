using System;
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
    public interface IContactService
    {
        bool Insert(Contact entity);
        bool Update(Contact entity);
        bool Delete(long id);

    }
    public class ContactService: IContactService
    {
        private readonly DataContext _db = null;

        public ContactService()
        {
            _db = new DataContext();
        }

        public bool Insert(Contact entity)
        {
            try
            {
                _db.Contacts.Add(entity);
                _db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                LogSystemService logService = new LogSystemService();
                var logs = new LogSystem();
                logs.IPAddress = CommonsHelper.GetIpAddress;
                logs.CreateDate = DateTime.Now;
                logs.Messenger = "Tài khoản: " + HttpContext.Current.Session[CommonsHelper.SessionAdminCp] + " [Lỗi Insert Contact]" +
                                 ex.ToString();
                logs.Status = false;
                logService.Insert(logs);
                return false;
            }
        }

        public bool Update(Contact entity)
        {
            try
            {
                var contact = _db.Contacts.FirstOrDefault(x => x.Id == entity.Id);
                if (contact != null)
                {
                    _db.Entry(contact).State = EntityState.Detached;
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
                logs.Messenger = "Tài khoản: " + HttpContext.Current.Session[CommonsHelper.SessionAdminCp] + " [Lỗi Update Contact]" +
                                 ex.ToString();
                logs.Status = false;
                logService.Insert(logs);
                return false;
            }
        }

        public bool Delete(long id)
        {
            try
            {
                var contact = _db.Contacts.Find(id);
                if (contact != null)
                {
                    contact.Status = -1;
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
                logs.Messenger = "Tài khoản: " + HttpContext.Current.Session[CommonsHelper.SessionAdminCp] + " [Lỗi Delete Contact]" +
                                 ex.ToString();
                logs.Status = false;
                logService.Insert(logs);
                return false;
            }
        }
        public List<Contact> ListContacts(long id)
        {
            return _db.Contacts.Where(x => x.Id == id).ToList();
        }
        public IEnumerable<Contact> ListAllContact()
        {
            return _db.Contacts.Where(x => x.Status != -1).OrderByDescending(x => x.CreateDate).ToList();
        }
        public Contact GetContactById(long id)
        {
            return _db.Contacts.SingleOrDefault(x => x.Id == id);
        }
        public bool UpdateStatus(long id, int status)
        {
            try
            {
                var ct = _db.Contacts.Find(id);
                if (ct != null)
                {
                    ct.Status = status;
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
                logs.Messenger = "Tài khoản: " + HttpContext.Current.Session[CommonsHelper.SessionAdminCp] + " [Lỗi updatestatus Contact]" +
                                 ex.ToString();
                logs.Status = false;
                logService.Insert(logs);
                return false;
            }
        }
    }
}
