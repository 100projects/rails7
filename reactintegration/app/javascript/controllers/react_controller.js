import { Controller } from "@hotwired/stimulus"
import React from "react";
import { createRoot } from "react-dom/client";
import Dashboard from "../Dashboard";

// Connects to data-controller="react"
export default class extends Controller {
  connect() {
    console.log("React controller connected");
    const app = document.getElementById("app");
    createRoot(app).render(<Dashboard />);
  }
}
