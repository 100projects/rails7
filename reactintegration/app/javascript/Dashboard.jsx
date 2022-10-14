import React, { useState } from "react";

function Dashboard() {
    const [count, setCount] = useState(0);
    return (
        <div>
            <p>You clicked {count} times!</p>
            <button className="text-red-600" onClick={() => setCount(count + 1)}>Click me</button>
        </div>
    );
}

export default Dashboard;