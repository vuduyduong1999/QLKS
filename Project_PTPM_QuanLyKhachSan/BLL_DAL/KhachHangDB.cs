using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    public class KhachHangDB
    {
        QLKSDataContext qlks = new QLKSDataContext();
        public bool addKhachHang(KhachHang khm)
        {
            try
            {
                qlks.KhachHangs.InsertOnSubmit(khm);
                qlks.SubmitChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
    }
}