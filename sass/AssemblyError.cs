using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace sasSX
{
    public enum AssemblyError
    {
        None = 0,
        InvalidInstruction = 1,
        InvalidLabel = 2,
        FileNotFound = 3,
        InvalidDirective = 4,
        DuplicateName = 5,
        InvalidExpression = 6,
        UnknownSymbol = 7,
        UncoupledStatement = 8,
        ValueTruncated = 9,
		RelativeAddressTooLong = 10,
		MegaROMSubpageOverflow =11,
    }
}
