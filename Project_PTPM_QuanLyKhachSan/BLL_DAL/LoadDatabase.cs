using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    public class LoadDatabase
    {
        QLKSDataContext qlks = new QLKSDataContext();
        public List<Phong> lstPhong(string loai)
        {
            var getphong = from p in qlks.Phongs 
                           where p.MaLoaiPhong == loai select p; 
             return getphong.ToList<Phong>();
        }
        public List<LoaiPhong> lstLoaiPhong()
        {
            var getLoai = from lp in qlks.LoaiPhongs select lp;
            return getLoai.ToList<LoaiPhong>();
        }
        public IQueryable lstgetMaP(string map)
        {
            var getMaPhong = from mp in qlks.Phongs select mp;
            return getMaPhong;
        }
    }
}
