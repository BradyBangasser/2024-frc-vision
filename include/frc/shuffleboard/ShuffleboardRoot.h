// Copyright (c) FIRST and other WPILib contributors.
// Open Source Software; you can modify and/or share it under the terms of
// the WPILib BSD license file in the root directory of this project.

#pragma once

#include <string_view>

namespace frc {

class ShuffleboardTab;

/**
 * The root of the data placed in Shuffleboard. It contains the tabs, but no
 * data is placed directly in the root.
 *
 * This class is package-private to minimize API surface area.
 */
class ShuffleboardRoot {
 public:
  /**
   * Gets the tab with the given title, creating it if it does not already
   * exist.
   *
   * @param title the title of the tab
   * @return the tab with the given title
   */
  virtual ShuffleboardTab& GetTab(std::string_view title) = 0;

  /**
   * Updates all tabs.
   */
  virtual void Update() = 0;

  /**
   * Enables all widgets in Shuffleboard that offer user control over actuators.
   */
  virtual void EnableActuatorWidgets() = 0;

  /**
   * Disables all widgets in Shuffleboard that offer user control over
   * actuators.
   */
  virtual void DisableActuatorWidgets() = 0;

  /**
   * Selects the tab in the dashboard with the given index in the range
   * [0..n-1], where <i>n</i> is the number of tabs in the dashboard at the time
   * this method is called.
   *
   * @param index the index of the tab to select
   */
  virtual void SelectTab(int index) = 0;

  /**
   * Selects the tab in the dashboard with the given title.
   *
   * @param title the title of the tab to select
   */
  virtual void SelectTab(std::string_view title) = 0;
};

}  // namespace frc
