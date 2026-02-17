/// Utility functions for organization logo handling
class OrganizationLogoUtils {
  /// Maps organization names to their logo asset paths
  /// Returns null if no logo is found for the organization
  static String? getOrganizationLogo(String organizationName) {
    // Normalize the organization name for matching
    final normalized = organizationName.toLowerCase().trim();
    
    // Map organization names to their logo files
    // Note: Must include full path with 'assets/' prefix as declared in pubspec.yaml
    // GG - Gaming Genesis / Gamers Guild
    if (normalized.contains('gg') || 
        normalized.contains('gaming genesis') || 
        normalized.contains('gamers guild')) {
      return 'assets/images/org_logos/gg_logo.png';
    }
    
    // JISSA - Junior Information Systems Security Association
    if (normalized.contains('jissa') || 
        normalized.contains('information systems security')) {
      return 'assets/images/org_logos/jissa_logo.png';
    }
    
    // JPCS - Junior Philippine Computer Society
    if (normalized.contains('jpcs') || 
        normalized.contains('philippine computer society')) {
      return 'assets/images/org_logos/jpcs_logo.png';
    }
    
    // MSC - Microsoft Community / Microsoft Student Community
    if (normalized.contains('microsoft community') || 
        normalized.contains('microsoft student')) {
      return 'assets/images/org_logos/msc_logo.png';
    }
    
    // SOAR
    if (normalized.contains('soar')) {
      return 'assets/images/org_logos/soar_logo.png';
    }
    
    // SPEAKS
    if (normalized.contains('speaks')) {
      return 'assets/images/org_logos/speaks_logo.png';
    }
    
    // Taguig Sanitation Office
    if (normalized.contains('taguig') && normalized.contains('sanitation')) {
      return 'assets/images/org_logos/taguig_sanitation_office.png';
    }
    
    return null;
  }
  
  /// Checks if an organization has a logo available
  static bool hasOrganizationLogo(String organizationName) {
    return getOrganizationLogo(organizationName) != null;
  }
}
