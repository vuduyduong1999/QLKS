using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    public class LoaiDichVuDB
    {
        QLKSDataContext qlks = new QLKSDataContext();
        public List<LoaiDichVu> getDsLDV()
        {
            var ds = from ldv in qlks.LoaiDichVus select ldv;
            return ds.ToList<LoaiDichVu>();
        }
    }
}