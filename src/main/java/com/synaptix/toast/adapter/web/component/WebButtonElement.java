package com.synaptix.toast.adapter.web.component;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Action;
import org.openqa.selenium.interactions.Actions;

import com.synaptix.toast.adapter.web.HasClickAction;
import com.synaptix.toast.automation.driver.web.SeleniumSynchronizedDriver;
import com.synaptix.toast.automation.driver.web.SynchronizedDriver;
import com.synaptix.toast.core.report.TestResult;
import com.synaptix.toast.core.runtime.IWebElementDescriptor;

public class WebButtonElement extends WebAutoElement implements HasClickAction {

	public WebButtonElement(
		IWebElementDescriptor element,
		SeleniumSynchronizedDriver driver) {
		super(element, driver);
	}

	public WebButtonElement(
		IWebElementDescriptor element) {
		super(element);
	}

	@Override
	public TestResult click() {
		WebElement find = frontEndDriver.find(descriptor);
		find.click();
		return new TestResult();
	}

	@Override
	public void dbClick() {
		Actions action = new Actions(((SeleniumSynchronizedDriver)frontEndDriver).getWebDriver());
		WebElement find = frontEndDriver.find(descriptor);
		Action doubleClick = action.doubleClick(find).build();
		doubleClick.perform();
	}
}
