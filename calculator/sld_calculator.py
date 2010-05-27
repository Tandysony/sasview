"""
    This module intends to compute the neutron scattering length density 
    of a molecule. It uses methods of the periodictable package to provide 
    easy user interface for  Sld calculator applications.
"""

import periodictable
from periodictable import formula
from periodictable.xsf import xray_energy, xray_sld_from_atoms
from periodictable.constants import avogadro_number
import periodictable.nsf
neutron_sld_from_atoms= periodictable.nsf.neutron_sld_from_atoms 

class SldCalculator(object):
    """
    Given a molecule, a density and a wavelength, this class 
    determine scattering length density.
    """
    def __init__(self):
        self.wavelength  = 6.0
        self.coherence   = 0.0
        self.absorption  = 0.0
        self.incoherence = 0.0
        self.sld_formula = None
        self.volume = 0.0
        self.density = None
        self.length= 0.0
        
    def set_value(self, user_formula, density, wavelength=6.0):
        """
        Store values into the sld calculator and compute the corresponding
        volume.
        """
        self.wavelength = wavelength
        self.density    = float(density)
        self.sld_formula = formula(str(user_formula), density=self.density)
       
        if self.density == 0:
            raise ZeroDivisionError("integer division or modulo\
                         by zero for density")
        self.volume = (self.sld_formula.mass / self.density) / avogadro_number\
                                *1.0e24   
        
        
    def calculate_xray_sld(self, element):
        """
        Get an element and compute the corresponding SLD for a given formula
        @param element:  elementis a string of existing atom
        """
        myformula = formula(str(element))
        if len(myformula.atoms) != 1:
            return 
        element = myformula.atoms.keys()[0] 
        energy = xray_energy(element.K_alpha)
        atom = self.sld_formula.atoms
        atom_reel, atom_im = xray_sld_from_atoms(atom,
                                              density= self.density,
                                              energy= energy)
        return atom_reel, atom_im
      
        
    def calculate_neutron_sld(self):
        """
        Compute the neutron SLD for a given molecule
        @return absorp: absorption
        return coh: coherence cross section
        @return inc: incoherence cross section
        """
        if self.density == 0:
            raise ZeroDivisionError("integer division or modulo\
                         by zero for density")
            return 
        atom = self.sld_formula.atoms
        coh, absorp, inc = neutron_sld_from_atoms(atom, self.density, 
                                                  self.wavelength)
        #Don't know if value is return in cm or  cm^(-1).assume return in cm
        # to match result of neutron inc of Alan calculator
        self.incoherence = inc
        self.absorption = absorp 
        self.coherence  = coh
        return self.coherence, self.absorption, self.incoherence
    
    
    def calculate_length(self):
        """
        Compute the neutron 1/e length
        """
        self.length = (self.coherence + self.absorption +\
                            self.incoherence) / self.volume
        return self.length
        
        
    def calculate_coherence_im(self):
        """
        Compute imaginary part of the absorption 
        """
        atom = self.sld_formula.atoms 
        #im: imaginary part of neutron SLD
        im = 0
        for el, count in atom.iteritems():
            if el.neutron.b_c_i is not None:
                im += el.neutron.b_c_i * count 
                
        if self.volume != 0:
            im = im/self.volume
        else:
            raise ZeroDivisionError("integer division or modulo\
                                 by zero for volume")
        return im
