using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    public class DangNhapDB
    {
        QLKSDataContext qlks = new QLKSDataContext();
        public int ktraDangNhap(string tk, string mk)
        {
            var tknv = qlks.NhanViens.Where(t => t.TaiKhoan == tk).FirstOrDefault();

            if (tknv == null)
            {
                return 0;
            }
            else
            {
                if (tknv.MatKhau != mk)
                {
                    return -1;
                }
                else
                    return (int)tknv.MaChucVu;
            }


        }
        public string getNameAccount(string tk)
        {
            var tkvn = qlks.NhanViens.Where(t => t.TaiKhoan == tk).FirstOrDefault();
            if (tkvn != null)
            {
                return tkvn.TenNhanVien;
            }
            return "";
        }
    }
}
