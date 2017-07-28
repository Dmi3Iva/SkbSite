using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Windows.Input;
using System.Windows.Forms;
using System.Drawing;
using Microsoft.VisualStudio.TestTools.UITesting;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Microsoft.VisualStudio.TestTools.UITest.Extension;
using Keyboard = Microsoft.VisualStudio.TestTools.UITesting.Keyboard;
using Microsoft.VisualStudio.TestTools.UITesting.HtmlControls;

namespace TestsSKB
{
    /// <summary>
    /// Summary description for CodedUITest1
    /// </summary>
    [CodedUITest]
    public class CodedUITest1
    {
        public CodedUITest1()
        {
        }

        [TestMethod]
        public void Authorization()
        {

            this.UIMap.UserAuthorization();
            this.UIMap.customerAuthorization();
            this.UIMap.adminAuthorization();

            // To generate code for this test, select "Generate Code for Coded UI Test" from the shortcut menu and select one of the menu items.
        }

        [TestMethod]
        public void NewsAddAndDelete()
        {
            var browser = BrowserWindow.Launch("http://localhost:8080");

            userAuthorization(browser);
            ClickLink(browser,"Новости");
            ClickInputButton(browser, "Добавить новость");
            EnterTextById(browser, "newsName", "HelloTest");
            browser.ExecuteScript("$('#newsContent').summernote('insertText', 'Обычная новость');");
            ClickButton(browser,"Добавить новость");

            Assert.AreEqual("HelloTest", GetNameNews(browser, "HelloTest").InnerText, "The name of the news is wrong");
            ClickButton(browser, "Удалить");
            browser.PerformDialogAction(BrowserDialogAction.Ok);
        }

        [TestMethod]
        public void ProjectAddAndDelete()
        {
            var browser = BrowserWindow.Launch("http://localhost:8080");

            userAuthorization(browser);
            ClickLink(browser, "Проекты");
            ClickInputButton(browser, "Добавить проект");
            EnterTextById(browser, "projectName", "HelloTest");
            browser.ExecuteScript("$('#about').summernote('insertText', 'Обычный проект');");
            ClickButton(browser, "Добавить проект");

            Assert.AreEqual("HelloTest", GetNameNews(browser, "HelloTest").InnerText, "The name of the project is wrong");
            ClickButton(browser, "Удалить");
            browser.PerformDialogAction(BrowserDialogAction.Ok);
        }

        [TestMethod]
        public void OrderAddAndDelete()
        {
            var browser = BrowserWindow.Launch("http://localhost:8080");

            orderAuthorization(browser);
            ClickLink(browser, "Заказы");
            ClickInputButton(browser, "Добавить заказ");
            EnterTextById(browser, "orderName", "HelloTest");
            browser.ExecuteScript("$('#orderContent').summernote('insertText', 'Обычный проект');");
            ClickButton(browser, "Добавить заказ");

            Assert.AreEqual("HelloTest", GetNameNews(browser, "HelloTest").InnerText, "The name of the project is wrong");
            ClickButton(browser, "Удалить");
            browser.PerformDialogAction(BrowserDialogAction.Ok);
        }

        [TestMethod]
        public void ModelAddAndDelete()
        {
            var browser = BrowserWindow.Launch("http://localhost:8080");

            adminAuthorization(browser);
            ClickLink(browser, "Оборудование");
            ClickInputButton(browser, "Добавить модель");
            EnterTextById(browser, "equipmentTypeName", "HelloTest");
            browser.ExecuteScript("$('#equipmentTypeAbout').summernote('insertText', 'Обычное описание');");
            browser.ExecuteScript("$('#equipmentTypeFeatures').summernote('insertText', 'Обычные характеристики');");
            ClickButton(browser, "Добавить модель");

            ClickButton(browser, "Удалить");
            browser.PerformDialogAction(BrowserDialogAction.Ok);
        }

        [TestMethod]
        public void EditAbout()
        {

            this.UIMap.aboutEditText();

        }

        HtmlHyperlink GetNameNews(UITestControl bro, string value)
        {
            var cell = new HtmlHyperlink(bro);
            cell.SearchProperties.Add(HtmlHyperlink.PropertyNames.InnerText, value);

            return cell;
        }

        void adminAuthorization(UITestControl bro)
        {
            ClickLink(bro, "Вход");
            EnterTextByName(bro, "username", "admin");
            EnterTextByName(bro, "password", "admin");
            ClickButton(bro, "Войти");
        }

        void userAuthorization(UITestControl bro)
        {
            ClickLink(bro, "Вход");
            EnterTextByName(bro, "username", "user");
            EnterTextByName(bro, "password", "user");
            ClickButton(bro, "Войти");
        }

        void orderAuthorization(UITestControl bro)
        {
            ClickLink(bro, "Вход");
            EnterTextByName(bro, "username", "customer");
            EnterTextByName(bro, "password", "customer");
            ClickButton(bro, "Войти");
        }

        void ClickInputButton(UITestControl bro, string value)
        {
            var button = new HtmlInputButton(bro);
            button.SearchProperties.Add(HtmlInputButton.PropertyNames.ValueAttribute, value);

            Mouse.Click(button);
        }


        void ClickButton(UITestControl bro, string value)
        {
            
            var button = new HtmlButton(bro);
            button.SearchProperties.Add(HtmlButton.PropertyNames.InnerText, value);

            Mouse.Click(button);
        }

        void ClickButtonByName(UITestControl bro, string value)
        {

            var button = new HtmlButton(bro);
            button.SearchProperties.Add(HtmlButton.PropertyNames.Name, value);

            Mouse.Click(button);
        }

        void EnterTextByName(UITestControl parent, string name, string value)
        {
            var edit = new HtmlEdit(parent);
            edit.SearchProperties.Add(HtmlEdit.PropertyNames.Name, name);
            edit.Text = value;
        }

        void EnterTextById(UITestControl parent, string id, string value)
        {
            var edit = new HtmlEdit(parent);
            edit.SearchProperties.Add(HtmlEdit.PropertyNames.Id, id);
            edit.Text = value;
        }
        void ClickLink(UITestControl parent, string innerText)
        {
            var link = new HtmlHyperlink(parent);
            link.SearchProperties.Add(HtmlHyperlink.PropertyNames.InnerText, innerText);

            Mouse.Click(link);
        }

        #region Additional test attributes

        // You can use the following additional attributes as you write your tests:

        ////Use TestInitialize to run code before running each test 
        //[TestInitialize()]
        //public void MyTestInitialize()
        //{        
        //    // To generate code for this test, select "Generate Code for Coded UI Test" from the shortcut menu and select one of the menu items.
        //}

        ////Use TestCleanup to run code after each test has run
        //[TestCleanup()]
        //public void MyTestCleanup()
        //{        
        //    // To generate code for this test, select "Generate Code for Coded UI Test" from the shortcut menu and select one of the menu items.
        //}

        #endregion

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }
        private TestContext testContextInstance;

        public UIMap UIMap
        {
            get
            {
                if ((this.map == null))
                {
                    this.map = new UIMap();
                }

                return this.map;
            }
        }

        private UIMap map;
    }
}
