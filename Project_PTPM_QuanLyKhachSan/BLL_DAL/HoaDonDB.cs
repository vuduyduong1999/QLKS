using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    public class HoaDonDB
    {
        QLKSDataContext qlks = new QLKSDataContext();
        public List<HoaDon> getDSHDfromPhong(string ma)
        {
            var cts = from ct in qlks.HoaDons where ct.MaPhong == ma select ct;
            return cts.ToList<HoaDon>();
        }
        public List<HoaDon> getDsHDromMNV(int ma)
        {
            var cts = from ct in qlks.HoaDons where ct.MaNV == ma select ct;
            return cts.ToList<HoaDon>();
        }
        public void deleteHoaDon(HoaDon del)
        {
            try
            {
                qlks.HoaDons.DeleteOnSubmit(del);
                qlks.SubmitChanges();
            }
            catch (Exception ex)
            { }
        }
        public bool addHoaDon(HoaDon hdn)
        {
            try
            {
                qlks.HoaDons.InsertOnSubmit(hdn);
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