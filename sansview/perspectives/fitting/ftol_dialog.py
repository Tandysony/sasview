
################################################################################
#This software was developed by the University of Tennessee as part of the
#Distributed Data Analysis of Neutron Scattering Experiments (DANSE)
#project funded by the US National Science Foundation. 
#
#See the license text in license.txt
#
#copyright 2009, University of Tennessee
################################################################################
import wx
import sys
from sans.guicomm.events import StatusEvent  
# default ftol
F_TOL = 1.49012e-08 

if sys.platform.count("win32") > 0:
    PANEL_WIDTH = 270 
    PANEL_HEIGHT = 250
    FONT_VARIANT = 0
else:
    PANEL_WIDTH = 285
    PANEL_HEIGHT = 255
    FONT_VARIANT = 1
    
"""
Dialog to set ftol for Scipy

    ftol(float): Relative error desired in the sum of squares.
"""
class ChangeFtol(wx.Dialog):
    """
    Dialog to select ftol
    """
    def __init__(self, parent, id=-1, title="FTolerance"):
        wx.Dialog.__init__(self, parent, id, title, 
                           size=(PANEL_WIDTH, PANEL_HEIGHT))
        # parent
        self.parent = parent
        # default ftol
        self.ftol = F_TOL
                # font size 
        self.SetWindowVariant(variant=FONT_VARIANT)
        # build layout
        panel = wx.Panel(self, -1)
        vbox = wx.BoxSizer(wx.VERTICAL)
        wx.StaticBox(panel, -1, 'ftol selection (Scipy)', (5, 5),
                      (PANEL_WIDTH*0.9, PANEL_HEIGHT*0.65))
        default_bt = wx.RadioButton(panel, -1, 'Default', (15, 30), 
                                    style=wx.RB_GROUP)
        default_bt.Bind(wx.EVT_RADIOBUTTON, self.OnFtolSelection)
        default_bt.SetValue(True)
        high_bt = wx.RadioButton(panel, -1, '1e-06', (15, 55))
        high_bt.SetValue(False)
        high_bt.Bind(wx.EVT_RADIOBUTTON, self.OnFtolSelection)
        mid_bt = wx.RadioButton(panel, -1, '1e-05', (15, 80))
        mid_bt.SetValue(False)
        mid_bt.Bind(wx.EVT_RADIOBUTTON, self.OnFtolSelection)
        low_bt = wx.RadioButton(panel, -1, '1e-04', (15, 105))
        low_bt.SetValue(False)
        low_bt.Bind(wx.EVT_RADIOBUTTON, self.OnFtolSelection)
        self.custom_bt = wx.RadioButton(panel, -1, 'Custom', (15, 130))
        self.custom_bt.SetValue(False)
        self.custom_bt.Bind(wx.EVT_RADIOBUTTON, self.OnFtolSelection)
        self.custombox = wx.TextCtrl(panel, -1, '', (95, 130))
        self.custombox.Disable()
        hbox = wx.BoxSizer(wx.HORIZONTAL)
        okButton = wx.Button(self, -1, 'Set', size=(70, 30))
        hbox.Add(okButton, 1, wx.RIGHT, 5)
        okButton.Bind(wx.EVT_BUTTON, self.OnClose)
        vbox.Add(panel)
        vbox.Add(hbox, 1, wx.ALIGN_CENTER | wx.TOP | wx.BOTTOM, 10)
        # set sizer
        self.SetSizer(vbox)
 
    def OnFtolSelection(self, event=None):
        """
        Changes the ftol on selection of the radio button
        """
        event.Skip()
        # event object and selection
        button = event.GetEventObject()
        selection = button.GetLabel()
        # get float value 
        if selection == 'Default':
            ftol = F_TOL   
            self.custombox.Disable()     
        elif selection == 'Custom':
            ftol = F_TOL 
            self.custombox.Enable(True)
        else:
            ftol =  float(selection)
            self.custombox.Disable()
        self.ftol = ftol    
        

    def OnClose(self, event):
        """
        Close event
        """
        # clear event
        event.Skip()
        flag = True
        # I case of the custom ftol
        if self.custom_bt.GetValue():
            try:
                ftol = float(self.custombox.GetValue())
                self.ftol = ftol
            except:
                flag = False
        if flag:
            # set ftol in fitting
            self.parent.manager.set_ftol(self.ftol) 
            msg = "The ftol (Scipy) is set to %s." % self.ftol
        else:
           msg = "Error in the selection... No changes in ftol."
        # post event for info
        wx.PostEvent( self.parent.manager.parent, 
                      StatusEvent(status= msg, info='warning')) 
    
        self.Destroy()

