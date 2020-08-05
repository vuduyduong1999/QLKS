using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    public class NhanVienDB
    {
        QLKSDataContext qlks = new QLKSDataContext();
        HoaDonDB hddb = new HoaDonDB();
        public List<NhanVien> getDSNhanVien()
        {
            var nhanviens = from nv in qlks.NhanViens select nv;
            return nhanviens.ToList<NhanVien>();
        }
        public bool addNhanVien(NhanVien nvm)
        {
            try
            {
                qlks.NhanViens.InsertOnSubmit(nvm);
                qlks.SubmitChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public NhanVien getNhanVienFromMNV(int ma)
        {
            NhanVien rs = qlks.NhanViens.Where(t => t.MaNhanVien == ma).FirstOrDefault();
            if (rs != null)
            {
                return rs;
            }
            return null;
        }
        public bool deleteNhanVien(NhanVien del)
        {
            try
            {
                List<HoaDon> dshd = hddb.getDsHDromMNV(del.MaNhanVien);
                foreach (HoaDon it in dshd)
                {
                    hddb.deleteHoaDon(it);
                }
                qlks.NhanViens.DeleteOnSubmit(del);
                qlks.SubmitChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public bool editNhanVien(NhanVien edit)
        {
            NhanVien rs = qlks.NhanViens.Where(t => t.MaNhanVien == edit.MaNhanVien).FirstOrDefault();
            if (rs != null)
            {
                rs = edit;
                qlks.SubmitChanges();
                return true;
            }
            return false;
        }
    }
}