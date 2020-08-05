using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    public class DichVuDB
    {
        QLKSDataContext qlks = new QLKSDataContext();
        ChiTietHDDB ctdb = new ChiTietHDDB();
        public List<DichVu> getDsDichVu()
        {
            var ds = from dv in qlks.DichVus select dv;
            return ds.ToList<DichVu>();
        }
        public DichVu getDichVuFromMa(string ma)
        {
            DichVu rs = qlks.DichVus.Where(t => t.MaDV == ma).FirstOrDefault();
            return rs;
        }
        public bool addDichVu(DichVu dvm)
        {
            DichVu rs = qlks.DichVus.Where(t => t.MaDV == dvm.MaDV).FirstOrDefault();
            if (rs == null)
            {
                try
                {
                    qlks.DichVus.InsertOnSubmit(dvm);
                    qlks.SubmitChanges();
                    return true;
                }
                catch{ }
            }
            return false;
           
        }
        public bool editDichVu(DichVu dv)
        {
            DichVu rs = qlks.DichVus.Where(t => t.MaDV == dv.MaDV).FirstOrDefault();
            if (rs != null)
            {
                rs = dv;
                qlks.SubmitChanges();
                return true;

            }
            return false;
        }
        public bool deleteDichVu(DichVu del)
        {
            DichVu rs = qlks.DichVus.Where(t => t.MaDV == del.MaDV).FirstOrDefault();
            if(rs != null)
            {
                try
                {
                    List<ChiTietHD> dsct = ctdb.getDsCTFromDV(rs.MaDV);
                    foreach (ChiTietHD it in dsct)
                    {
                        ctdb.deleteChiTietHD(it);
                    }
                }
                catch { }
                qlks.DichVus.DeleteOnSubmit(rs);
                qlks.SubmitChanges();
                return true;
            }
            return false;
           

        }
        public List<LoaiDichVu> getLoaiDV()
        {

            var l = from loai in qlks.LoaiDichVus select loai;
            return l.ToList<LoaiDichVu>();

        }
        public IQueryable getDichVu()
        {
            var dv = from d in qlks.DichVus
                     join l in qlks.LoaiDichVus
                     on d.MaLoaiDV equals l.MaLoaiDV
                     select new { d.MaDV, l.TenLoaiDV, d.TenDV, d.DonGiaDV, d.SoLuongCon, d.DVT };
            return dv;
        }
        public List<DichVu> getDichVuFromMaLDV(string ma)
        {
            var ds = from d in qlks.DichVus where d.MaLoaiDV == ma select d;

            return ds.ToList<DichVu>();
        }
    }
}
