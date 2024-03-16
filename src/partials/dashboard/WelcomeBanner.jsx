import React from 'react';

function WelcomeBanner() {
  // Generate random circles
  const circles = Array.from({ length: 12 }, (_, index) => ({
    key: index,
    size: Math.floor(Math.random() * 20) + 5, // Random size between 5 and 25
    opacity: Math.random() * 0.2 + 0.3, // Random opacity between 0.3 and 0.2
    top: Math.random() * 100, // Random top position
    left: Math.random() * 100, // Random left position
  }));

  return (
    <div className="relative bg-purple-500 p-4 sm:p-6 rounded-sm overflow-hidden mb-8">
      {/* Background illustration */}
      <div className="absolute inset-0 bg-purple-600 opacity-75"></div>

      {/* Circles */}
      <div className="absolute inset-0 flex items-center justify-center pointer-events-none">
        {circles.map(circle => (
          <div
            key={circle.key}
            className="absolute"
            style={{
              width: `${circle.size}px`,
              height: `${circle.size}px`,
              opacity: circle.opacity,
              top: `${circle.top}%`,
              left: `${circle.left}%`,
              borderRadius: '50%',
              backgroundColor: '#ffffff',
            }}
          ></div>
        ))}
      </div>

      {/* Content */}
      <div className="relative">
        <h1 className="text-2xl md:text-3xl text-slate-800 dark:text-slate-100 font-bold mb-1">Good afternoon, John Doe 👋</h1>
        <p className="dark:text-indigo-200">Check your transactions here:</p>
      </div>
    </div>
  );
}

export default WelcomeBanner;