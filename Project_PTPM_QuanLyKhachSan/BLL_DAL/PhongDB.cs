using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{

    public class PhongDB
    {
        QLKSDataContext qlks = new QLKSDataContext();
        HoaDonDB ctdb = new HoaDonDB();
        public List<Phong> getDSPhong()
        {
            var phongs = from p in qlks.Phongs select p;
            return phongs.ToList<Phong>();
        }
        public List<Phong> getDSPhongFromMaLP(string ma)
        {
            var phongs = from p in qlks.Phongs where p.MaLoaiPhong == ma select p;
            return phongs.ToList<Phong>();
        }
        public Phong getPhongFromMa(string ma)
        {
            Phong rs = qlks.Phongs.Where(t => t.MaPhong == ma).FirstOrDefault();
            if (rs != null)
                return rs;
            return null;
        }
        public bool addPhong(Phong pm)
        {
            try
            {
                qlks.Phongs.InsertOnSubmit(pm);
                qlks.SubmitChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public bool deletePhong(Phong del)
        {

            try
            {
                List<HoaDon> ctrs = ctdb.getDSHDfromPhong(del.MaPhong);
                foreach (HoaDon it in ctrs)
                {
                    ctdb.deleteHoaDon(it);
                }
                qlks.Phongs.DeleteOnSubmit(del);
                qlks.SubmitChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }

        }
        public bool editPhong(Phong edit)
        {
            Phong rs = qlks.Phongs.Where(t => t.MaPhong == edit.MaPhong).FirstOrDefault();
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