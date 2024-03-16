import React from 'react';

function DashboardCard03() {
  return (
    <div className="col-span-full xl:col-span-12 bg-white dark:bg-slate-800 shadow-lg rounded-sm border border-slate-200 dark:border-slate-700">
      <header className="px-5 py-4 border-b border-slate-100 dark:border-slate-700">
        <h2 className="font-semibold text-slate-800 dark:text-slate-100">Transaction History</h2>
      </header>
      <div className="p-3">
        {/* Table */}
        <div className="overflow-x-auto">
          <table className="table-auto w-full dark:text-slate-300">
            {/* Table header */}
            <thead className="text-xs uppercase text-slate-400 dark:text-slate-500 bg-slate-50 dark:bg-slate-700 dark:bg-opacity-50 rounded-sm">
              <tr>
                <th className="p-2">
                  <div className="font-semibold text-left">Transaction ID</div>
                </th>
                <th className="p-2">
                  <div className="font-semibold text-left">Sender Address</div>
                </th>
                <th className="p-2">
                  <div className="font-semibold text-left">Receiver Address</div>
                </th>
                <th className="p-2">
                  <div className="font-semibold text-left">Amount</div>
                </th>
                <th className="p-2">
                  <div className="font-semibold text-left">Category</div>
                </th>
                <th className="p-2">
                  <div className="font-semibold text-center">Timestamp</div>
                </th>
                <th className="p-2">
                  <div className="font-semibold text-center">Status</div>
                </th>
                <th className="p-2">
                  <div className="font-semibold text-center">Transaction Type</div>
                </th>
                <th className="p-2">
                  <div className="font-semibold text-center">Block Number</div>
                </th>
                <th className="p-2">
                  <div className="font-semibold text-center">Transaction Fee</div>
                </th>
              </tr>
            </thead>
            {/* Table body */}
            <tbody className="text-sm font-medium divide-y divide-slate-100 dark:divide-slate-700">
              {/* Row */}
              <tr>
                <td className="p-2">
                  <div className="text-center">31002</div>
                </td>
                <td className="p-2">
                  <div className="text-center">0xf0f0...62B2</div>
                </td>
                <td className="p-2">
                  <div className="text-center text-emerald-500">0x9f07...8310</div>
                </td>
                <td className="p-2">
                  <div className="text-center">5.497</div>
                </td>
                <td className="p-2">
                  <div className="text-center text-sky-500">Others</div>
                </td>
                <td className="p-2">
                  <div className="text-center">30 min ago</div>
                </td>
                <td className="p-2">
                  <div className="text-center text-emerald-500">Success</div>
                </td>
                <td className="p-2">
                  <div className="text-center">Deposit</div>
                </td>
                <td className="p-2">
                  <div className="text-center">47131078</div>
                </td>
                <td className="p-2">
                  <div className="text-center">0.03444825</div>
                </td>
              </tr>
              {/* Row */}
              <tr>
              <td className="p-2">
                  <div className="text-center">31004</div>
                </td>
                <td className="p-2">
                  <div className="text-center">0xf0f0...62B2</div>
                </td>
                <td className="p-2">
                  <div className="text-center text-emerald-500">0x9f07...8310</div>
                </td>
                <td className="p-2">
                  <div className="text-center">18.403</div>
                </td>
                <td className="p-2">
                  <div className="text-center text-sky-500">Others</div>
                </td>
                <td className="p-2">
                  <div className="text-center">30 min ago</div>
                </td>
                <td className="p-2">
                  <div className="text-center text-emerald-500">Success</div>
                </td>
                <td className="p-2">
                  <div className="text-center">Deposit</div>
                </td>
                <td className="p-2">
                  <div className="text-center">47131078</div>
                </td>
                <td className="p-2">
                  <div className="text-center">0.06621425</div>
                </td>
              </tr>
              {/* Row */}
              <tr>
              <td className="p-2">
                  <div className="text-center">31005</div>
                </td>
                <td className="p-2">
                  <div className="text-center">0xf0f0...62B2</div>
                </td>
                <td className="p-2">
                  <div className="text-center text-emerald-500">0x0d25...b176</div>
                </td>
                <td className="p-2">
                  <div className="text-center">18.428</div>
                </td>
                <td className="p-2">
                  <div className="text-center text-sky-500">Others</div>
                </td>
                <td className="p-2">
                  <div className="text-center">30 min ago</div>
                </td>
                <td className="p-2">
                  <div className="text-center text-emerald-500">Success</div>
                </td>
                <td className="p-2">
                  <div className="text-center">Deposit</div>
                </td>
                <td className="p-2">
                  <div className="text-center">47131078</div>
                </td>
                <td className="p-2">
                  <div className="text-center">0.06713905</div>
                </td>
              </tr>
              {/* Row */}
              <tr>
                <td className="p-2">
                  <div className="text-center">31008</div>
                </td>
                <td className="p-2">
                  <div className="text-center">0xf0f0...62B2</div>
                </td>
                <td className="p-2">
                  <div className="text-center text-emerald-500">0x9f07...8310</div>
                </td>
                <td className="p-2">
                  <div className="text-center">5.504</div>
                </td>
                <td className="p-2">
                  <div className="text-center text-sky-500">Others</div>
                </td>
                <td className="p-2">
                  <div className="text-center">31 min ago</div>
                </td>
                <td className="p-2">
                  <div className="text-center text-emerald-500">Success</div>
                </td>
                <td className="p-2">
                  <div className="text-center">Deposit</div>
                </td>
                <td className="p-2">
                  <div className="text-center">47131078</div>
                </td>
                <td className="p-2">
                  <div className="text-center">0.03561510</div>
                </td>
              </tr>
              {/* Row */}
              <tr>
                <td className="p-2">
                  <div className="text-center">31003</div>
                </td>
                <td className="p-2">
                  <div className="text-center">0xf0f0...62B2</div>
                </td>
                <td className="p-2">
                  <div className="text-center text-emerald-500">0x0d25...b176</div>
                </td>
                <td className="p-2">
                  <div className="text-center">8.139</div>
                </td>
                <td className="p-2">
                  <div className="text-center text-sky-500">Others</div>
                </td>
                <td className="p-2">
                  <div className="text-center">31 min ago</div>
                </td>
                <td className="p-2">
                  <div className="text-center text-red-500">Failed</div>
                </td>
                <td className="p-2">
                  <div className="text-center">Withdrawal</div>
                </td>
                <td className="p-2">
                  <div className="text-center">47131078</div>
                </td>
                <td className="p-2">
                  <div className="text-center">0.01559157</div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}

export default DashboardCard03;