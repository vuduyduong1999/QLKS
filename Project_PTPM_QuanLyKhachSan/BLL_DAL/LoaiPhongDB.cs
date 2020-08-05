using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    public class LoaiPhongDB
    {
        QLKSDataContext qlks = new QLKSDataContext();
        PhongDB pdb = new PhongDB();
        BangGiaPhongDB bgpdb = new BangGiaPhongDB();
        public List<LoaiPhong> getDSLoaiPhong()
        {
            var loaiphongs = from lp in qlks.LoaiPhongs select lp;
            return loaiphongs.ToList<LoaiPhong>();
        }
        public LoaiPhong getLoaiPhongFromMaLP(string ma)
        {
            LoaiPhong rs = qlks.LoaiPhongs.Where(t => t.MaLoaiPhong == ma).FirstOrDefault();
            if (rs != null)
                return rs;
            return null;
        }
        public bool addLoaiPhong(LoaiPhong lpm)
        {
            try
            {
                qlks.LoaiPhongs.InsertOnSubmit(lpm);
                qlks.SubmitChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        public bool deleteLoaiPhong(LoaiPhong del)
        {
            try
            {
                List<Phong> dsp = pdb.getDSPhongFromMaLP(del.MaLoaiPhong);
                foreach (Phong it in dsp)
                {
                    pdb.deletePhong(it);
                }
                List<BangGiaPhong> bgps = bgpdb.getDsBGPFromLP(del.MaLoaiPhong);
                foreach (BangGiaPhong it in bgps)
                {
                    bgpdb.deleteBangGiaPhong(it);
                }
                qlks.LoaiPhongs.DeleteOnSubmit(del);
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