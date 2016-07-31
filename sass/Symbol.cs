using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace sasSX
{
    public struct Symbol
    {
        public bool IsLabel;
        public uint Value;
		public uint Subpage;

        public Symbol(uint value)
        {
            Value = value;
            IsLabel = false;
			Subpage = 0;
        }

        public Symbol(uint value, bool isLabel)
        {
            Value = value;
            IsLabel = isLabel;
			Subpage = 0;
        }

		public Symbol(uint value,uint subpage)
		{
			Value = value;
			IsLabel = false;
			Subpage = subpage;
		}

		public Symbol(uint value, bool isLabel, uint subpage)
		{
			Value = value;
			IsLabel = isLabel;
			Subpage = subpage;
		}

    }
}
